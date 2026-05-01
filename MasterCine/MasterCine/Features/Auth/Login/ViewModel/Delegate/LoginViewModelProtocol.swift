//
//  LoginViewModelProtocol.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

protocol LoginViewModelDelegateProtocol: AnyObject {
    func loginDidFailure(message: String)
    func loginDidSucceed()
    func showLoading(_ start: Bool)
}
