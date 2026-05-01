//
//  FormValidator.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import Foundation

typealias FormResult = Result<Void, FormValidatorError>

struct FormValidator {
    static func isValidName(_ text: String) -> Bool {
        if case .failure = verifyEmptyText(text) {
            return false
        }
        
        return true
    }
    
    static func isEmailValid(_ email: String) -> Bool {
        if case .failure = verifyEmptyText(email) {
            return false
        }
        
        if case .failure = verifyEmailFormatValid(email) {
            return false
        }
        
        return true
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        if case .failure = verifyEmptyText(password) {
            return false
        }
        
        if case .failure = verifyPasswordHasMore5Character(password) {
            return false
        }
        
        return true
    }
    
    static func isConfirmPasswordValid(password: String, otherPassowrd: String) -> Bool {
        if case .failure(let error) = verifyPasswordsMatch(password: password, otherPassword: otherPassowrd) {
            return false
        }
        
        return true
    }
}

// MARK: - SPECIFIC VERIFICATIONS
extension FormValidator {
    private static func verifyEmptyText(_ text: String) -> FormResult {
        return text.isEmpty
            ? .failure(.emptyText)
            : .success(())
    }
    
    private static func verifyEmailFormatValid(_ email: String) -> FormResult {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
            ? .success(())
            : .failure(.emailFormatInvalid)
    }
    
    private static func verifyPasswordHasMore5Character(_ text: String) -> FormResult {
        return text.count > 5
            ? .success(())
            : .failure(.passwordShort)
    }
    
    private static func verifyPasswordsMatch(password: String, otherPassword: String) -> FormResult {
        return password == otherPassword
            ? .success(())
            : .failure(.passwordsNotMatch)
    }
}
