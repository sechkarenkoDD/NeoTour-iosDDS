//
//  OnboardingViewController.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 09.04.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    var viewModel: OnboardingViewModelProtocol! {
        didSet {
            image.image = UIImage(named: viewModel.imageName)
            viewModel.fetchCategories()
            viewModel.fetchTours()
            viewModel.fetchRecommendations()
        }
    }
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 37
        image.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        image.contentMode = .scaleAspectFill
        return image
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
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )
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
        viewModel = OnboardingViewModel()
    }
    
    private func setupConstraints() {
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(goButton)
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(image).inset(-86 - 32)
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
    
    @objc private func goButtonTapped() {
        let mainViewController = MainViewController()
        mainViewController.viewModel = viewModel.getMainViewModel()
        navigationController?.pushViewController(mainViewController, animated: true)
        
    }
    
}

