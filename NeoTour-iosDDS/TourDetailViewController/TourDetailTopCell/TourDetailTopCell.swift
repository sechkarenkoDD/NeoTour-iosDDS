//
//  TourDetailTopCell.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 24.04.2024.
//

import UIKit
import SnapKit

class TourDetailTopCell: UITableViewCell {
    static let id = "TourDetailTopCell"
    
    var viewModel: TourDetailTopCellViewModel! {
        didSet {
            Task {
                let imageData = await viewModel.getImage()
                pictureImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var bottomBorder: UIView = {
        let view = UIView()
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(pictureImageView)
        addSubview(bottomBorder)
        
        pictureImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(41)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
