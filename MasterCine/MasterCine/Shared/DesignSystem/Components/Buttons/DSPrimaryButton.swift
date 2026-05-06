//
//  DSPrimaryButton.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 01/05/26.
//

import UIKit

final class DSPrimaryButton: UIButton {
    var title: String
    var onTapped: (() -> Void)
    
    init(
        title: String,
        onTapped: @escaping (() -> Void)
    ) {
        self.title = title
        self.onTapped = onTapped
        super.init(frame: .zero)
        configButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configButton() {
        customizeButtonApperance()
        setButtonHeight()
        setButtonAction()
    }
    
    private func customizeButtonApperance() {
        backgroundColor = DSColor.red
        layer.cornerRadius = 8
        clipsToBounds = true
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private func setButtonHeight() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

// MARK: - ACTION
extension DSPrimaryButton {
    private func setButtonAction() {
        addTarget(self, action: #selector(tappedButtonAction), for: .touchUpInside)
    }
    
    @objc private func tappedButtonAction() {
        onTapped()
    }
}
