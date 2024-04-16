//
//  MainView.swift
//
//
//  Created by Dmitry on 10.04.2024.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    static let sectionHeaderElementKind = "section-header-element-kin"
    
    enum Section: CaseIterable {
        case categoriesTour
        case galeryTour
        case recommendedTour
    }
    
    enum Item: Hashable {
        case category(Categories)
        case galery(Galery)
        case recommended(Tour)
    }
    
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.id )
        collectionView.register(GaleryCell.self, forCellWithReuseIdentifier: GaleryCell.id)
        collectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: RecommendedCell.id)
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: MainView.sectionHeaderElementKind, withReuseIdentifier: HeaderView.reuseIdentifier)
        
        
        collectionView.indicatorStyle = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        mainCollectionView.delegate = self
        view.backgroundColor = .white
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
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
            
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch (sectionLayoutKind) {
            case .categoriesTour:
                return self.generateCategoriesLayout(isWide: isWideView)
            case .galeryTour:
                return self.generateToursLayout(isWide: isWideView)
            case .recommendedTour:
                return self.generateRecommendedTourLayout()
            }
        }
        return layout
    }
    
    private func generateCategoriesLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutSupplementaryItem(layoutSize: itemSize)
        
        let groupFractionalWidth: CGFloat = isWide ? 0.475 : 0.95
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupFractionalWidth), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
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
    
    private func generateToursLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(2/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupFractionalWidth: CGFloat = isWide ? 0.475 : 0.95
        let groupFractionalHeight: CGFloat = isWide ? 1/3 : 2/3
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(groupFractionalWidth),
            heightDimension: .fractionalWidth(groupFractionalHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
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
    
    private func generateRecommendedTourLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let itemSpacing: CGFloat = 5
        item.contentInsets  = NSDirectionalEdgeInsets(
            top: itemSpacing,
            leading: itemSpacing,
            bottom: itemSpacing,
            trailing: itemSpacing
        )
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: MainView.sectionHeaderElementKind,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: mainCollectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            
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
                    fatalError("Failed to dequeue a cell of type CategoriesCell")
                }
                //getData
                return cell
            case .galeryTour:
                guard case .galery(_) = item else {
                    fatalError("Invalid item type for carouselTour section")
                }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: GaleryCell.id,
                    for: indexPath
                ) as! GaleryCell
                //getData
                return cell
            case .recommendedTour:
                guard case .recommended(_) = item else {
                    fatalError("Invalid item type for carouselTour section")
                }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: RecommendedCell.id,
                    for: indexPath
                ) as! RecommendedCell
                //getData
                return cell
            }
            
        })
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath)
            -> UICollectionReusableView? in
            
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
        // addItesm
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
}


extension MainView: UICollectionViewDelegate {
    
}
 

