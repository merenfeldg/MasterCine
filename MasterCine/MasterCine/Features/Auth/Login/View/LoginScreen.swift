//
//  LoginScreen.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import UIKit

final class LoginScreen: UIView {
    weak var delegate: LoginScreenDelegateProtocol?
    private var loginModel = LoginModel()
    
    lazy var emailTextField: DSTextField = {
        DSTextField(
            title: "Email",
            placeholder: "Digite seu email...",
            leftIcon: .envelope,
            onTextChanged: setEmail
        )
    }()
    
    lazy var passwordTextField: DSTextField = {
        DSTextField(
            title: "Senha",
            placeholder: "Digite sua senha...",
            leftIcon: .lock,
            isPassword: true,
            onTextChanged: setPassword
        )
    }()
    
    lazy var loginPrimaryButton: DSPrimaryButton = {
        DSPrimaryButton(
            title: "Login",
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
    
    private func setEmail(_ email: String) {
        loginModel.email = email
    }
    
    private func setPassword(_ password: String) {
        loginModel.password = password
    }
}

//MARK: - CONFIG VIEW
extension LoginScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginPrimaryButton)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            loginPrimaryButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            loginPrimaryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginPrimaryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
}
