//
//  RegisterViewModelDelegateProtocol.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 09/05/26.
//

protocol RegisterViewModelDelegateProtocol: AnyObject {
    func registerDidFailure(message: String)
    func registerDidSucceed()
    func showLoading(_ start: Bool)
}
