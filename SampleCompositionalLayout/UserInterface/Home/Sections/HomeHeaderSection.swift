//
//  HomeHeaderSection.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import UIKit

struct HomeHeaderSection {
    private let headerInfo: HeaderInfo
    init(headerInfo: HeaderInfo) {
        self.headerInfo = headerInfo
    }
}

extension HomeHeaderSection: HomeSectionProtocol {
    
    var numberOfItems: Int {
        return headerInfo.item.count
    }
    
    func layoutSection(_ view: UIView,
                       _ layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(view.frame.height / 3)
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
            cellType: HomeHeaderCollectionViewCell.self
        ).then {
            $0.bind(headerInfo.item[indexPath.row])
        }
    }
    
    func didSelectedItem(_ collectionView: UICollectionView,
                         at indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeHeaderCollectionViewCell {
            print("cell tapped:", cell.titleLabel.text ?? "title nil")
        }
    }
    
}
