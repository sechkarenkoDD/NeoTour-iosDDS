//
//  OnboardingScreenView.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 09.04.2024.
//

import UIKit
import SnapKit

class OnboardingScreenView: UIViewController {
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "home")
        imageView.layer.cornerRadius = 37
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Winter Vacation Trips"
        label.font = UIFont(name: "SFProDisplay-Black", size: 36)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string:
            """
            Enjoy your winter vacations with warmth
            and amazing sightseeing on the mountains.
            Enjoy the best experience with us!
            """
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.font = UIFont(name: "SFProDisplay-Light", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var goButton: UIButton = {
        let button = UIButton()
        button.setTitle("Let's Go!      ", for: .normal)
        button.setImage(.arrow, for: .normal)
        button.backgroundColor = .accentColor
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.semanticContentAttribute = .forceRightToLeft
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        setupTargetAction()
    }
    
    private func setupConstraints() {
        view.addSubview(mainImage)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(goButton)
        
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(mainImage).inset(-86 - 32)
            make.width.equalTo(283)
            make.height.equalTo(86)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(titleLabel).inset(-86 - 12)
            make.width.equalTo(289)
            make.height.equalTo(78)
        }
        
        goButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(descriptionLabel).inset(-78 - 40)
            make.width.equalTo(177.14)
            make.height.equalTo(53)
        }
    }
    
    private func setupTargetAction() {
        goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
    }
    
    @objc func goButtonTapped() {
        let mainVC = MainView()
        navigationController?.pushViewController(mainVC, animated: true)
        
    }
    
}

