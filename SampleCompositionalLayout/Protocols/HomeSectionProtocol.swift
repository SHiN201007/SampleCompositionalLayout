//
//  SectionProtocol.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/26.
//

import Foundation
import UIKit

protocol HomeSectionProtocol {
    
    // セクションのアイテム数
    var numberOfItems: Int { get }
    
    // レイアウトの生成
    func layoutSection(_ view: UIView,
                       _ layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection
    
    // セルの生成
    func configureCell(_ collectionView: UICollectionView,
                       at indexPath: IndexPath) -> UICollectionViewCell
    
    func didSelectedItem(_ collectionView: UICollectionView,
                         at indexPath: IndexPath)
}
