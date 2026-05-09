//
//  RegisterViewModel.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 09/05/26.
//

import Foundation
import FirebaseAuth

public struct AuthFailure: LocalizedError {
    public let message: String
    public var errorDescription: String? { message }
    public init(_ message: String) { self.message = message }
}

final class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegateProtocol?
    
    func registerUser(_ userInfo: RegisterModel) {
        if case .failure(let error) = FormValidator.isValidName(userInfo.name) {
            delegate?.registerDidFailure(message: error.errorDescription ?? "")
            return
        }
        
        if case .failure(let error) = FormValidator.isEmailValid(userInfo.email) {
            delegate?.registerDidFailure(message: error.errorDescription ?? "")
            return
        }
        
        if case .failure(let error) = FormValidator.isPasswordValid(userInfo.password) {
            delegate?.registerDidFailure(message: error.errorDescription ?? "")
            return
        }
        
        if case .failure(let error) = FormValidator.isConfirmPasswordValid(
            password: userInfo.password,
            otherPassowrd: userInfo.confirmPassword
        ) {
            delegate?.registerDidFailure(message: error.errorDescription ?? "")
            return
        }
        
        delegate?.showLoading(true)
        
        Auth.auth().createUser(
            withEmail: userInfo.email,
            password: userInfo.password
        ) { [weak self] _, error in
            guard let self else { return }
            
            if let error {
                delegate?.registerDidFailure(
                    message: mapFirebaseError(error).message
                )
            } else {
                delegate?.registerDidSucceed()
            }
        }
    }
}

extension RegisterViewModel {
    private func mapFirebaseError(_ error: Error) -> AuthFailure {
        let nsError = error as NSError
        
        guard nsError.domain == AuthErrorDomain,
              let code = AuthErrorCode(rawValue: nsError.code) else {
            return AuthFailure("Não foi possível concluir a operação. Tente novamente.")
        }
        
        switch code {
            case .invalidEmail:
                return AuthFailure("Digite um e-mail válido.")
            case .wrongPassword, .userNotFound, .invalidCredential:
                return AuthFailure("E-mail ou senha incorretos.")
            case .emailAlreadyInUse:
                return AuthFailure("Esse e-mail já está em uso.")
            case .weakPassword:
                return AuthFailure("Sua senha é fraca. Use uma senha mais forte.")
            case .networkError:
                return AuthFailure("Sem conexão. Tente novamente.")
            case .tooManyRequests:
                return AuthFailure("Muitas tentativas. Aguarde um pouco e tente novamente.")
            case .userDisabled:
                return AuthFailure("Sua conta foi desativada.")
            case .operationNotAllowed:
                return AuthFailure("Operação não permitida no momento.")
            default:
                return AuthFailure("Não foi possível concluir a operação. Tente novamente.")
        }
    }
}
