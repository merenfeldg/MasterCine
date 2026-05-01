//
//  DSTextField.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//


import UIKit

final class DSTextField: UIView {
    let title: String
    let placeholder: String
    let leftIcon: DSIconsTextField
    let keyBoardType: UIKeyboardType
    
    lazy var container: UIView = {
        let container = UIView(
            frame: CGRect(x: 0, y: 0, width: 40, height: 40)
        )
        
        return container
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.keyboardType = keyBoardType
        textField.leftView = container
        textField.leftViewMode = .always
        
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.gray.cgColor
        
        return textField
    }()
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView(
            frame: CGRect(x: 10, y: 0, width: 24, height: 20)
        )
        
        icon.image = UIImage(systemName: leftIcon.outlinedIcon)
        icon.tintColor = .gray
        icon.contentMode = .scaleAspectFit
        
        return icon
    }()
    
    init(
        title: String,
        placeholder: String,
        leftIcon: DSIconsTextField,
        keyBoardType: UIKeyboardType = .default
    ) {
        self.title = title
        self.placeholder = placeholder
        self.keyBoardType = keyBoardType
        self.leftIcon = leftIcon
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CONFIG VIEW
extension DSTextField {
    private func configView() {
        addElements()
        setupActions()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(textField)
        container.addSubview(iconImage)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56),
            
            iconImage.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 20),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

// MARK: - ACTIONS
extension DSTextField {
    private func setupActions() {
        textField.addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
    
    @objc private func didBeginEditing() {
        textField.layer.borderColor = UIColor.black.cgColor
        iconImage.image = UIImage(systemName: leftIcon.fillIcon)
        iconImage.tintColor = .black
    }
    
    @objc private func didEndEditing() {
        textField.layer.borderColor = UIColor.gray.cgColor
        iconImage.image = UIImage(systemName: leftIcon.outlinedIcon)
        iconImage.tintColor = .gray
    }
}
