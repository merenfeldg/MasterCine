//
//  RegisterScreen.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 09/05/26.
//

import UIKit

final class RegisterScreen: UIBaseView {
    weak var delegate: RegisterScreenDelegateProtocol?
    private(set) var registerModel = RegisterModel()
    
    lazy var nameTextField: DSTextField = {
        DSTextField(
            title: "Nome",
            placeholder: "Digite seu nome...",
            leftIcon: .person,
            onTextChanged: setNameInModel
        )
    }()
    
    lazy var emailTextField: DSTextField = {
        DSTextField(
            title: "Email",
            placeholder: "Digite seu email...",
            leftIcon: .envelope,
            onTextChanged: setEmailInModel
        )
    }()
    
    lazy var passwordTextField: DSTextField = {
        DSTextField(
            title: "Senha",
            placeholder: "Digite sua senha...",
            leftIcon: .lock,
            isPassword: true,
            onTextChanged: setPasswordInModel
        )
    }()
    
    lazy var confirmPasswordTextField: DSTextField = {
        DSTextField(
            title: "Confirmar senha",
            placeholder: "Digite a senha novamente...",
            leftIcon: .lock,
            isPassword: true,
            onTextChanged: setConfirmPasswordInModel
        )
    }()
    
    lazy var registerPrimaryButton: DSPrimaryButton = {
        DSPrimaryButton(
            title: "Registrar",
            onTapped: {}
        )
    }()
    
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - MODEL UPDATES
extension RegisterScreen {
    private func setNameInModel(_ name: String) {
        registerModel.name = name
    }
    
    private func setEmailInModel(_ email: String) {
        registerModel.email = email
    }
    
    private func setPasswordInModel(_ password: String) {
        registerModel.password = password
    }
    
    private func setConfirmPasswordInModel(_ confirmPassword: String) {
        registerModel.confirmPassword = confirmPassword
    }
}

//MARK: - CONFIG VIEW
extension RegisterScreen {
    private func configView() {
        backgroundColor = DSColor.background
        addElements()
        super.disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(registerPrimaryButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            registerPrimaryButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            registerPrimaryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerPrimaryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
}
