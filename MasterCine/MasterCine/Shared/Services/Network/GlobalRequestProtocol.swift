//
//  GlobalRequestProtocol.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 06/05/26.
//

import Foundation

protocol GlobalRequestProtocol {
    func request(apiRequest: APIRequest, baseURL: String, timeout: TimeInterval) -> URLRequest?
}
