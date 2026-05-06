//
//  APIClient.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 06/05/26.
//

import Foundation

final class APIClient {
    let shared = APIClient()
    
    let baseURL: String
    let timeout: TimeInterval
    let session: URLSession
    let requestBuilder: GlobalRequestProtocol
    
    init(
        baseURL: String? = nil,
        timeout: TimeInterval = 6,
        session: URLSession = URLSession.shared,
        requestBuilder: GlobalRequestProtocol = DefaultRequestImpl()
    ) {
        self.timeout = timeout
        self.session = session
        self.requestBuilder = requestBuilder
        
        if let baseURL {
            self.baseURL = baseURL
        } else {
            guard
                let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String
            else {
                fatalError("BaseURL não encontrada no arquivo: info.plist")
            }
            
            self.baseURL = baseURL
        }
    }
    
    func request(
        request: APIRequest,
        completion: @escaping (Result<Void, NetworkError>) -> Void
    ) {
        execute(apiRequest: request) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success:
                        completion(.success(()))
                    
                    case .failure(let failure):
                        completion(.failure(failure))
                }
            }
        }
    }
    
    func request<T: Decodable>(
        request: APIRequest,
        decodeType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        execute(apiRequest: request) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let data):
                        guard let data else {
                            completion(.failure(.noData))
                            return
                        }
                    
                        do {
                            let decodedData = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(decodedData))
                        } catch {
                            NetworkLogger.logDecodingError(error: error, type: T.self)
                            completion(.failure(.decodingError(error)))
                        }
                    
                    case .failure(let failure):
                        completion(.failure(failure))
                    }
            }
        }
    }
    
    private func execute(
        apiRequest: APIRequest,
        completion: @escaping (Result<Data?, NetworkError>) -> Void
    ) {
        guard let requestCompleted = requestBuilder.request(
            apiRequest: apiRequest,
            baseURL: baseURL,
            timeout: timeout
        ) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = session.dataTask(with: requestCompleted) { data, response, error in
            
            NetworkLogger.log(
                request: requestCompleted,
                response: response,
                data: data,
                error: error
            )
            
            if let error {
                completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCode(code: httpResponse.statusCode)))
                return
            }
            
            completion(.success(data))
        }
    }
}
