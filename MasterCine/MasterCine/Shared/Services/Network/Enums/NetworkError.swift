//
//  NetworkError.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 06/05/26.
//

import Foundation

enum NetworkError {
    case invalidURL(url: String)
    case invalidRequest
    case invalidResponse
    case decodingError(Error)
    case networkFailure(Error)
    case statusCode(code: Int)
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .invalidURL(let url):
                return "URL inválida -> \(url)"
            case .invalidRequest:
                return "Requisição inválida da API"
            case .invalidResponse:
                return "Resposta inválida da API"
            case .decodingError(let error):
                return "Decodificação falhou: \(error.localizedDescription)"
            case .networkFailure(let error):
                return "Falha na conexão: \(error.localizedDescription)"
            case .statusCode(let code):
                return "Status code inesperado: CÓDIGO: \(code)"
            case .noData:
                return "Não houve retorno da API"
        }
    }
}
