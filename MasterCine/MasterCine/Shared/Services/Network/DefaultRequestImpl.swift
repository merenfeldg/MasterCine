//
//  DefaultRequest.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 06/05/26.
//

import Foundation

struct DefaultRequestImpl: GlobalRequestProtocol {
    func request(apiRequest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest? {
        let urlString = baseURL + apiRequest.endpoint
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod.rawValue
        request.allHTTPHeaderFields = apiRequest.header
        request.timeoutInterval = timeout
        
        if let parameters = apiRequest.typeParameter {
            switch parameters {
                case .encodable(let encodable):
                    request.httpBody = try? JSONEncoder().encode(encodable)
                case .dictionary(let dictionary):
                    request.httpBody = try? JSONSerialization.data(withJSONObject: dictionary)
            }
        }
        
        return request
    }
}
