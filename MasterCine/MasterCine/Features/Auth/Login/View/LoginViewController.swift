//
//  LoginViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import UIKit

final class LoginViewController: UIViewController {
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
        
    }
    
    func tappedCreateAccountButton() {
        
    }
}

extension LoginViewController: LoginViewModelDelegateProtocol {
    func loginDidFailure(message: String) {
        
    }
    
    func loginDidSucceed() {
        
    }
    
    func showLoading(_ start: Bool) {
        
    }
}
