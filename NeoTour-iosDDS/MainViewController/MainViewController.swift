//
//  MainViewController.swift
//
//
//  Created by Dmitry on 10.04.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    static let sectionHeaderElementKind = "section-header-element-kin"
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private var dataSource: DataSource!
    
    var viewModel: MainViewModelProtocol!
    
    enum Section: Int, CaseIterable {
        case categoriesTour
        case galeryTour
        case recommendedTour
    }
    
    enum Item: Hashable {
        case category(Category)
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
        configureDataSource()
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
            (sectionIndex, _) -> NSCollectionLayoutSection? in
            
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .categoriesTour:
                return self.generateCategoriesLayout()
            case .galeryTour:
                return self.generateToursLayout()
            case .recommendedTour:
                return self.generateRecommendedTourLayout()
            }
        }
        return layout
    }
    
    private func generateCategoriesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .absolute(50)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
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
    
    private func generateToursLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(2/3)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .fractionalWidth(2/3))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
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
    
    private func generateRecommendedTourLayout() -> NSCollectionLayoutSection {
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
            count: 2
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(50)
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
                cell.viewModel = self.viewModel.getDataForCategoriesCell(at: indexPath)
                return cell
            case .galeryTour:
                guard case .galery(_) = item else {
                    fatalError("Invalid item type for galeryTour section")
                }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: GaleryCell.id,
                    for: indexPath
                ) as! GaleryCell
                cell.viewModel = self.viewModel.getDataForGaleryCell(at: indexPath)
                return cell
            case .recommendedTour:
                guard case .recommended(_) = item else {
                    fatalError("Invalid item type for recommendedTour section")
                }
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: GaleryCell.id,
                    for: indexPath
                ) as! GaleryCell
                cell.viewModel = self.viewModel.getDataForRecommendedCell(at: indexPath)
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
        
        let categoryItems = viewModel.forCategories
        snapshot.appendItems(categoryItems.map { Item.category($0) }, toSection: .categoriesTour)
        
        let galeryItems = viewModel.toursForGaleries
        snapshot.appendItems(galeryItems.map { Item.galery($0) }, toSection: .galeryTour)
        
        let recommendedItems = viewModel.toursForRecommendations
        snapshot.appendItems(recommendedItems.map { Item.recommended($0) }, toSection: .recommendedTour)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}


extension MainViewController: UICollectionViewDelegate {
    
}


