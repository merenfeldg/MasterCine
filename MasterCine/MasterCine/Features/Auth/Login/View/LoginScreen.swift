//
//  LoginScreen.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import UIKit

final class LoginScreen: UIBaseView {
    weak var delegate: LoginScreenDelegateProtocol?
    private(set) var loginModel = LoginModel()
    
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
    
    lazy var loginPrimaryButton: DSPrimaryButton = {
        DSPrimaryButton(
            title: "Login",
            onTapped: {}
        )
    }()
    
    lazy var createAccountSecondaryButton: DSSecondaryButton = {
        DSSecondaryButton(
            title: "Criar uma conta",
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
extension LoginScreen {
    private func setEmailInModel(_ email: String) {
        loginModel.email = email
    }
    
    private func setPasswordInModel(_ password: String) {
        loginModel.password = password
    }
}

//MARK: - CONFIG VIEW
extension LoginScreen {
    private func configView() {
        backgroundColor = DSColor.background
        addElements()
        super.disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        
        addSubview(loginPrimaryButton)
        addSubview(createAccountSecondaryButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            loginPrimaryButton.bottomAnchor.constraint(equalTo: createAccountSecondaryButton.topAnchor, constant: -16),
            loginPrimaryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginPrimaryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            createAccountSecondaryButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            createAccountSecondaryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            createAccountSecondaryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
}
