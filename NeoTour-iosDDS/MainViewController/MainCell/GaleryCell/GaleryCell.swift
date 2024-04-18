//
//  GaleryCell.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 13.04.2024.
//

import UIKit
import SnapKit

class GaleryCell: UICollectionViewCell {
    static let id = "GaleryCell"
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        title.backgroundColor = .clear
        title.textAlignment = .center
        title.textColor = .white
        title.textAlignment = .left
        return title
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .accentColor
        image.clipsToBounds = true
        image.layer.cornerRadius = 19
        return image
    }()
    
    private var blackoutBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .blackoutColor
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        image.addSubview(blackoutBackground)
        image.addSubview(titleLabel)
        
        image.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(image).inset(-16)
            make.leading.equalTo(image).inset(-12)
            make.width.equalTo(-30)
        }
        
        blackoutBackground.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(image)
            make.height.equalTo(56)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
