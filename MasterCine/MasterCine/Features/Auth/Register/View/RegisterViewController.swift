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
        <#code#>
    }
    
    func tappedHaveAccountButton() {
        
    }
}

extension RegisterViewController: RegisterViewModelDelegateProtocol {
    func registerDidFailure(message: String) {
        
    }
    
    func registerDidSucceed() {
        
    }
    
    func showLoading(_ start: Bool) {
        
    }
}
