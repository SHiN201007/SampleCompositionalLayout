//
//  HomeMainItemSection.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import UIKit

struct HomeMainItemSection {
    private let mainInfo: MainInfo
    init(mainInfo: MainInfo) {
        self.mainInfo = mainInfo
    }
}

extension HomeMainItemSection: HomeSectionProtocol {
    
    var numberOfItems: Int {
        return mainInfo.item.count
    }
     
    func layoutSection(_ view: UIView, _ layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        
        
        let horizontalCount = 3
        let verticalCount = numberOfItems / horizontalCount
        let cellSize = view.frame.width / CGFloat(horizontalCount)
        
        // セルのサイズ
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .estimated(cellSize),
                heightDimension: .estimated(cellSize)
            )
        )
        
        // 横３枚のグループ
        let items = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: item,
            count: horizontalCount
        )
        
        // 横グループを縦に並べるグループ
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(cellSize * CGFloat(verticalCount))
            ),
            subitem: items,
            count: verticalCount
        )
        
        // section 設定
        return NSCollectionLayoutSection(group: group).then {
            $0.orthogonalScrollingBehavior = .continuous
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
            cellType: HomeMainItemCollectionViewCell.self
        ).then {
            $0.bind(mainInfo.item[indexPath.row])
        }
    }
    
    func didSelectedItem(_ collectionView: UICollectionView,
                         at indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeMainItemCollectionViewCell {
            print("cell tapped:", cell.titleLabel.text ?? "title nil")
        }
    }
    
}
