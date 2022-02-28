//
//  HomeContentCollectionViewCell.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import UIKit
import Reusable

class HomeContentCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configView()
    }
    
    private func configView() {
        backView.layer.cornerRadius = 10.0
    }

}

extension HomeContentCollectionViewCell: HomeCellProtocol {
    
    func bind(_ item: ItemProtocol) {
        titleLabel.text = item.name
    }
    
}
