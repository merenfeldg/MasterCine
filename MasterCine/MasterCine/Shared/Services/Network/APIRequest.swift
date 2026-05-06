//
//  APIRequest.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 06/05/26.
//

struct APIRequest {
    let endpoint: String
    let httpMethod: HTTPMethod
    let header: [String: String]?
    let typeParameter: TypeParameter?
    
    init(
        endpoint: String,
        httpMethod: HTTPMethod = .get,
        header: [String : String]? = nil,
        typeParameter: TypeParameter? = nil
    ) {
        self.endpoint = endpoint
        self.httpMethod = httpMethod
        self.header = header
        self.typeParameter = typeParameter
    }
}
