//
//  MainView.swift
//
//
//  Created by Dmitry on 10.04.2024.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Discover"
        titleLabel.font = UIFont(name: "SFProDisplay-Black", size: 32)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.hidesBackButton = true
    }
}
