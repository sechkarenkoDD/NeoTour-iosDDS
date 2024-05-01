//
//  TourDetailBottomCell.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 24.04.2024.
//

import UIKit
import SnapKit

class TourDetailBottomCell: UITableViewCell {
    
    
    static let id = "TourDetailBottomCell"
    
    var viewModel: TourDetailBottomCellViewModelProtocol! {
        didSet {
            tourNameLabel.text = viewModel.title
            tourLocationLabel.text = viewModel.location
            tourDescriptionLabel.text = viewModel.description
            configureComments()
        }
    }
    
    private lazy var tourNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SFProDisplay-Black", size: 24)
        return lbl
    }()
    
    private lazy var tourLocationLabel: UILabel = {
        let lbl = UILabel()
//        lbl.addImage(image: UIImage(named: "locationMark")!)
        lbl.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        return lbl
    }()
    
    private let tourDescriptionTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        return lbl
    }()
    
    
    private lazy var tourDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let tourReviewsTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Reviews"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        return lbl
    }()
    
    private let reviewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let bookButton: UIButton = {
        let button = UIButton()
        button.setTitle("Book Now", for: .normal)
        button.backgroundColor = .accentColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        contentView.layer.cornerRadius = 36
        setupTargetAction()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Задаем отступ сверху для 'contentView', чтобы "поднять" содержимое ячейки вверх
        let offset: CGFloat = 30 // Высота, на которую ячейка будет "занесена" вверх
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: -offset, left: 0, bottom: 0, right: 0))
        
    }
    
    private func setupLayout() {
        contentView.addSubview(tourNameLabel)
        contentView.addSubview(tourLocationLabel)
        contentView.addSubview(tourDescriptionTitleLabel)
        contentView.addSubview(tourDescriptionLabel)
        contentView.addSubview(tourReviewsTitleLabel)
        contentView.addSubview(reviewsStackView)
        contentView.addSubview(bookButton)
        
        tourNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(29)
        }
        
        tourLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(tourNameLabel).inset(12)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(29)
        }
        
        tourDescriptionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(tourLocationLabel).inset(32)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(24)
        }
        
        tourDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(tourDescriptionTitleLabel).inset(12)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
        tourReviewsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(tourDescriptionLabel).inset(32)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
        reviewsStackView.snp.makeConstraints { make in
            make.top.equalTo(tourReviewsTitleLabel).inset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
        bookButton.snp.makeConstraints { make in
            make.top.equalTo(reviewsStackView).inset(50)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalToSuperview()
            make.height.height.equalTo(50)
        }
    }
    
    private func setupTargetAction() {
        bookButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
    }
    
    @objc func bookButtonTapped() {
        //        let vc = BookView()
        //        vc.viewModel = viewModel.getDataForBookView()
        //        vc.modalPresentationStyle = .formSheet // или .pageSheet
        //        self.present(vc, animated: true)
//        delegate?.bookButtonDidTap()
        
    }
    
    func configureComments() {
        // Очищаем стек от предыдущих отзывов
        reviewsStackView.arrangedSubviews.forEach {
            reviewsStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        // Добавляем новые отзывы
//        for review in viewModel.reviews {
//            let reviewLabel = CommentsView(configuration: review)
//            reviewsStackView.addArrangedSubview(reviewLabel)
//        }
    }
    
    
    
}
