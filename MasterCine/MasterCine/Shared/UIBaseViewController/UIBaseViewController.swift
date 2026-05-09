//
//  UIBaseViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 09/05/26.
//

import UIKit

class UIBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissKeyboardOnTap()
    }
    
    private func setupDismissKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
