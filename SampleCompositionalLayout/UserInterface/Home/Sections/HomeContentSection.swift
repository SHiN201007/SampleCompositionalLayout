//
//  HomeContentSection.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import UIKit

struct HomeContentSection {
    private let contentInfo: ContentInfo
    init(contentInfo: ContentInfo) {
        self.contentInfo = contentInfo
    }
}

extension HomeContentSection: HomeSectionProtocol {
    
    var numberOfItems: Int {
        return contentInfo.item.count
    }
    
    func layoutSection(_ view: UIView,
                       _ layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        
        let itemHeight: CGFloat = view.frame.height / 5
        
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(itemHeight)
            )
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(itemHeight * CGFloat(contentInfo.item.count))
            ),
            subitems: [item]
        )
        
        return NSCollectionLayoutSection(group: group).then {
            $0.orthogonalScrollingBehavior = .paging
            $0.contentInsets = .init(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0
            )
        }
    }
    
    func configureCell(_ collectionView: UICollectionView,
                       at indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(
            for: indexPath,
            cellType: HomeContentCollectionViewCell.self
        ).then {
            $0.bind(contentInfo.item[indexPath.row])
        }
    }
    
    func didSelectedItem(_ collectionView: UICollectionView,
                         at indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeContentCollectionViewCell {
            print("cell tapped:", cell.titleLabel.text ?? "title nil")
        }
    }
    
}
