//
//  RegisterViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 09/05/26.
//

import UIKit

final class RegisterViewController: UIBaseViewController {
    private let screen: RegisterScreen = RegisterScreen()
    private let viewModel: RegisterViewModel = RegisterViewModel()
    
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

extension RegisterViewController: RegisterScreenDelegateProtocol {
    func tappedCreateAccountButton() {
        viewModel.registerUser(screen.registerModel)
    }
    
    func tappedHaveAccountButton() {
        goToLoginScreen()
    }
    
    private func goToLoginScreen() {
        navigationController?.pushViewController(
            LoginViewController(),
            animated: true
        )
    }
}

extension RegisterViewController: RegisterViewModelDelegateProtocol {
    func registerDidFailure(message: String) {
        showAlertController(title: "ATENÇÃO", message: message)
    }
    
    func registerDidSucceed() {
        let tabBar = MainTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
    func showLoading(_ start: Bool) {
        
    }
}
