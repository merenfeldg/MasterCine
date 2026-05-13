//
//  Loading.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 13/05/26.
//

import UIKit

final class Loading: UIBaseView {
    private static let shared: Loading = Loading()
    private var loadingCount: Int = 0
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.isUserInteractionEnabled = false
        return blurView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.secondarySystemBackground.withAlphaComponent(0.9)
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.hidesWhenStopped = true
        
        return activityIndicator
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Carregando..."
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension Loading {
    private func configView() {
        isUserInteractionEnabled = true
        backgroundColor = .clear
        
        addElements()
        super.disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(blurView)
        addSubview(containerView)
        containerView.addSubview(activityIndicator)
        containerView.addSubview(messageLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
}

//MARK: - CONTROL METHODS
extension Loading {
    static func start(view: UIView? = nil) {
        DispatchQueue.main.async {
            let target = view ?? UIApplication.mc_primaryKeyWindow
            guard let container = target else { return }
            Loading.shared.incrementAndShow(view: container)
        }
    }
    
    static func stop() {
        DispatchQueue.main.async {
            Loading.shared.decrementAndHide()
        }
    }
    
    private func incrementAndShow(view: UIView) {
        loadingCount += 1
        guard superview == nil else { return }
        show(view: view)
    }
    
    private func show(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0
        view.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        activityIndicator.startAnimating()
        
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            guard let self else { return }
            alpha = 1
        })
    }
    
    private func decrementAndHide() {
        guard loadingCount > 0 else { return }
        loadingCount -= 1
        if loadingCount == 0 {
            hide()
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            guard let self else { return }
            alpha = 0
        }, completion: { [weak self] _ in
            guard let self else { return }
            activityIndicator.stopAnimating()
            removeFromSuperview()
        })
    }
}
