//
//  MainViewController.swift
//
//
//  Created by Dmitry on 10.04.2024.
//

import UIKit
import SnapKit

enum Section: Int, CaseIterable {
    case categoriesTour
    case galeryTour
    case recommendedTour
    
    var itemCount: Int {
        switch self {
        case .categoriesTour: 4
        case .galeryTour: 1
        case .recommendedTour: 2
        }
    }
}

class MainViewController: UIViewController {
    static let sectionHeaderElementKind = "section-header-element-kin"
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private var dataSource: DataSource!
    
    
    enum Item: Hashable {
        case category(Categories)
        case galery(Galery)
        case recommended(Galery)
    }
    
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createLayout()
        )
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.id )
        collectionView.register(GaleryCell.self, forCellWithReuseIdentifier: GaleryCell.id)
        
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: MainViewController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier
        )
        
        collectionView.indicatorStyle = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        setupNavigationBar()
        configureCollectionView()
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Discover"
        titleLabel.font = UIFont(name: "SFProDisplay-Black", size: 32)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.hidesBackButton = true
    }
    
    private func configureCollectionView() {
        view.addSubview(mainCollectionView)
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex,
             layoutEnvironment)
            -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else {
                fatalError("could not create a sectionKind instance")
            }
            
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .categoriesTour:
                return self.generateCategoriesLayout(sectionKind.itemCount)
            case .galeryTour:
                return self.generateToursLayout(sectionKind.itemCount)
            case .recommendedTour:
                return self.generateRecommendedTourLayout(sectionKind.itemCount)
            }
        }
        return layout
    }
    
    private func generateCategoriesLayout(_ sectionKind: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutSupplementaryItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
            heightDimension: .absolute(50)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: sectionKind
        )
        let groupSpacing: CGFloat = 5
        group.contentInsets = NSDirectionalEdgeInsets(
            top: groupSpacing,
            leading: groupSpacing,
            bottom: groupSpacing,
            trailing: groupSpacing
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
        
    }
    
    private func generateToursLayout(_ sectionKind: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(2/3)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
            heightDimension: .fractionalWidth(2/3))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: sectionKind
        )
        let groupSpacing: CGFloat = 5
        group.contentInsets = NSDirectionalEdgeInsets(
            top: groupSpacing,
            leading: groupSpacing,
            bottom: groupSpacing,
            trailing: groupSpacing
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func generateRecommendedTourLayout(_ sectionKind: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemSpacing: CGFloat = 5
        item.contentInsets  = NSDirectionalEdgeInsets(
            top: itemSpacing,
            leading: itemSpacing,
            bottom: itemSpacing,
            trailing: itemSpacing
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.5)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: sectionKind
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: MainViewController.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: mainCollectionView, cellProvider: { (
            collectionView,
            indexPath,
            item
        ) -> UICollectionViewCell? in
            
            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .categoriesTour:
                guard case .category(_) = item else {
                    fatalError("Invalid item type for categoriesTour section")
                }
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CategoriesCell.id,
                    for: indexPath
                ) as? CategoriesCell else {
                    fatalError("Failed to dequeue a cell of type categoriesCell")
                }
                cell.titleCategories.text = "\(item)"
                return cell
            case .galeryTour:
                guard case .galery(_) = item else {
                    fatalError("Invalid item type for galeryTour section")
                }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: GaleryCell.id,
                    for: indexPath
                ) as! GaleryCell
                //getData
                return cell
            case .recommendedTour:
                guard case .recommended(_) = item else {
                    fatalError("Invalid item type for recommendedTour section")
                }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: GaleryCell.id,
                    for: indexPath
                ) as! GaleryCell
                //getData
                return cell
            }
            
        })
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath
        ) -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.reuseIdentifier,
                for: indexPath) as? HeaderView else {
                fatalError("Cannot create header view")
            }
            
            supplementaryView.label.text = "Recommended"
            return supplementaryView
        }
        
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.categoriesTour, .galeryTour, .recommendedTour])
        snapshot.appendItems(<#T##identifiers: [Item]##[Item]#>, toSection: .categoriesTour)
        snapshot.appendItems(<#T##identifiers: [Item]##[Item]#>, toSection: .galeryTour)
        snapshot.appendItems(<#T##identifiers: [Item]##[Item]#>, toSection: .recommendedTour)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}


extension MainViewController: UICollectionViewDelegate {
    
}


