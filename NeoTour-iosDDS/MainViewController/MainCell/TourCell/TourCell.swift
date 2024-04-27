//
//  GaleryCell.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 13.04.2024.
//

import UIKit
import SnapKit

class TourCell: UICollectionViewCell {
    static let id = "GaleryCell"
    
    var viewModel: TourCellViewModeProtocol! {
        didSet {
            title.text = viewModel.title
            guard let imageData = viewModel.image else { fatalError("imageDara for cell is failed") }
            image.image = UIImage(data: imageData)
        }
    }
    
    private let title: UILabel = {
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
        image.addSubview(title)
        
        image.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        blackoutBackground.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(image)
            make.height.equalTo(56)
        }
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(blackoutBackground).inset(16)
            make.leading.trailing.equalTo(blackoutBackground).inset(12)
            make.width.equalTo(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
