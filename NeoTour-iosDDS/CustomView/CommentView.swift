//
//  CommentView.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 09.05.2024.
//

import UIKit
import SnapKit

class CommentView: UIView {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    init(configuration: Review) {
        super.init(frame: .zero)
        setupLayout()
        configure(with: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(with configuration: Review) {
        Task {
            let imageData = try await ImageManager.shared.fetchImage(configuration.userPhoto)
            avatarImageView.image = UIImage(data: imageData)
        }
        nameLabel.text = configuration.userName
        reviewLabel.text = configuration.comment
    }
    
    private func setupLayout() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(reviewLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp_trailingMargin).inset(8)
            make.centerY.equalTo(avatarImageView.snp_centerYWithinMargins)
            make.trailing.equalToSuperview()
        }
        
        reviewLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(nameLabel.snp_topMargin).inset(12)
            make.trailing.bottom.equalToSuperview()
        }
    }
    
}
