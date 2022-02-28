//
//  HomeMainItemCollectionViewCell.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import UIKit
import Reusable

class HomeMainItemCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configView()
    }
    
    private func configView() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(named: "backgroundColor")?.cgColor
    }

}

extension HomeMainItemCollectionViewCell: HomeCellProtocol {
    
    func bind(_ item: ItemProtocol) {
        titleLabel.text = item.name
    }
    
}
