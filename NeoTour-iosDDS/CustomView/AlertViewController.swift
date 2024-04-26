//
//  AlertViewController.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 24.04.2024.
//

import UIKit
import SnapKit

class AlertViewController: UIViewController {
    
    private let messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "Your trip has been booked!"
        messageLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    private let okButton: UIButton = {
        let okButton = UIButton()
        okButton.setTitle("Ok", for: .normal)
        okButton.backgroundColor = .accentColor
        okButton.setTitleColor(.white, for: .normal)
        okButton.layer.cornerRadius = 25
        return okButton
    }()
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupLayout()
        setupTargetAction()
    }
    
    private func setupLayout() {
        view.addSubview(containerView)
        containerView.addSubview(messageLabel)
        containerView.addSubview(okButton)
        
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(-16)
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(190)
        }

        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(40)
            make.leading.equalTo(containerView).inset(20)
            make.trailing.equalTo(-20)
        }

        okButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel).inset(32)
            make.centerX.equalTo(messageLabel)
            make.leading.equalTo(messageLabel).inset(40)
            make.trailing.equalTo(messageLabel).inset(-40)
            make.height.equalTo(50)
        }
    }
    
    private func setupTargetAction() {
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
    }
    
    @objc private func okButtonTapped() {
        dismiss(animated: true)
    }
    
    
}
