//
//  DSTextField.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//


import UIKit

final class DSTextField: UIBaseView {
    let title: String
    let placeholder: String
    let leftIcon: DSIconsTextField
    let keyBoardType: UIKeyboardType
    let isPassword: Bool
    let onTextChanged: ((String) -> Void)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = title
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = DSColor.white
        
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.keyboardType = keyBoardType
        textField.leftView = container
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = isPassword
        
        textField.backgroundColor = DSColor.greyNormal
        textField.textColor = DSColor.white
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: DSColor.greyLight]
        )
        
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = DSColor.greyNormal.cgColor
        
        return textField
    }()
    
    lazy var container: UIView = {
        let container = UIView(
            frame: CGRect(x: 0, y: 0, width: 40, height: 40)
        )
        
        return container
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
        keyBoardType: UIKeyboardType = .default,
        isPassword: Bool = false,
        onTextChanged: @escaping ((String) -> Void)
    ) {
        self.title = title
        self.placeholder = placeholder
        self.keyBoardType = keyBoardType
        self.leftIcon = leftIcon
        self.isPassword = isPassword
        self.onTextChanged = onTextChanged
        
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
        super.disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(textField)
        container.addSubview(iconImage)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
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
        textField.layer.borderColor = DSColor.white.cgColor
        iconImage.image = UIImage(systemName: leftIcon.fillIcon)
        iconImage.tintColor = DSColor.white
    }
    
    @objc private func didEndEditing() {
        textField.layer.borderColor = DSColor.greyNormal.cgColor
        iconImage.image = UIImage(systemName: leftIcon.outlinedIcon)
        iconImage.tintColor = DSColor.greyLight
        onTextChanged(textField.text ?? "")
    }
}
