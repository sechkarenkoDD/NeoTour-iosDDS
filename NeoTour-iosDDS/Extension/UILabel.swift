//
//  UILabel.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 01.05.2024.
//

import UIKit

extension UILabel {
    convenience init(size: CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont(name: "SFProDisplay-Semibold", size: size)
        self.backgroundColor = .clear
        self.textAlignment = .left
        self.textColor = .white
    }
}
