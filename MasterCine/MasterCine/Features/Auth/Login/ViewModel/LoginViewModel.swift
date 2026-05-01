//
//  LoginViewModel.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import Foundation
import FirebaseAuth

final class LoginViewModel {
    weak var delegate: LoginViewModelDelegateProtocol?
    
    func login(_ userInfo: LoginModel) {
        if case .failure(let error) = FormValidator.isEmailValid(userInfo.email) {
            delegate?.loginDidFailure(message: error.errorDescription ?? "")
            return
        }
        
        if case .failure(let error) = FormValidator.isPasswordValid(userInfo.email) {
            delegate?.loginDidFailure(message: error.errorDescription ?? "")
            return
        }
        
        delegate?.showLoading(true)
        
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { [weak self] _, error in
            guard let self else { return }
            delegate?.showLoading(false)
            
            if let error {
                delegate?.loginDidFailure(message: error.localizedDescription)
            } else {
                delegate?.loginDidSucceed()
            }
        }
    }
}
