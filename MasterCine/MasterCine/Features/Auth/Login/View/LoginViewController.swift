//
//  LoginViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import UIKit

final class LoginViewController: UIBaseViewController {
    private let screen: LoginScreen = LoginScreen()
    private let viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    func configProtocols() {
        screen.delegate = self
        viewModel.delegate = self
    }
}

extension LoginViewController: LoginScreenDelegateProtocol {
    func tappedLoginButton() {
        viewModel.login(screen.loginModel)
    }
    
    func tappedCreateAccountButton() {
        goToRegisterScreen()
    }
    
    private func goToRegisterScreen() {
        navigationController?.pushViewController(
            RegisterViewController(),
            animated: true
        )
    }
}

extension LoginViewController: LoginViewModelDelegateProtocol {
    func loginDidFailure(message: String) {
        showAlertController(title: "ATENÇÃO", message: message)
    }
    
    func loginDidSucceed() {
        let tabBar = MainTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
    func showLoading(_ start: Bool) {
        
    }
}
