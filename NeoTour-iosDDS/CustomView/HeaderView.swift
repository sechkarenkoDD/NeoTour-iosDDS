//
//  HeaderView.swift
//
//
//  Created by Dmitry on 13.04.2024.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "header-reuse-identifier"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HeaderView {
    func configure() {
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.adjustsFontForContentSizeCategory = true
        
        let inset: CGFloat = 10
        label.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(inset)
            make.trailing.bottom.equalToSuperview().inset(-inset)
        }
        
        label.font = UIFont(name: "SFProDisplay-Black", size: 20)
    }
}
