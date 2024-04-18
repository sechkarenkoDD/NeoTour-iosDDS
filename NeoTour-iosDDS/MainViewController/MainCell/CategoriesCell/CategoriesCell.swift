//
//  CategoriesCell.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 13.04.2024.
//

import UIKit
import SnapKit

class CategoriesCell: UICollectionViewCell {
    static let id = "CategoriesCell"
    
    let titleCategories: UILabel = {
        let title = UILabel()
        title.backgroundColor = .clear
        title.textAlignment = .center
        title.textColor = .black
        title.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return title
    }()
    
    var pointUnderSelectedTitle: UIView = {
        let circleView = UIView()
        circleView.backgroundColor = .accentColor
        circleView.layer.cornerRadius = 3.5
        circleView.isHidden = true
        return circleView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(titleCategories)
        addSubview(pointUnderSelectedTitle)
        
        titleCategories.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(11)
        }
        
        pointUnderSelectedTitle.snp.makeConstraints { make in
            make.centerX.equalTo(titleCategories)
            make.top.equalTo(titleCategories)
            make.height.width.equalTo(7)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
