//
//  FormValidatorError.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import Foundation

enum FormValidatorError {
    case emptyText
    case passwordShort
    case emailFormatInvalid
    case passwordsNotMatch
}

extension FormValidatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .emptyText:
                return "Campo não pode estar vazio"
            case .passwordShort:
                return "A senha não pode ter menos que 6 caracteres"
            case .emailFormatInvalid:
                return "Email inserido está com formato inválido"
            case .passwordsNotMatch:
                return "Digite a mesma senha nos dois campos."
        }
    }
}
