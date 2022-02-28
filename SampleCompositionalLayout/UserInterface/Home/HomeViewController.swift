//
//  HomeViewController.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var compositionalLayout: UICollectionViewLayout = {
        return UICollectionViewCompositionalLayout { [weak self] section, layout in
            return self?.sections[section].layoutSection((self?.view)!, layout)
        }
    }()
    
    private var sections: [HomeSectionProtocol] = [
        HomeHeaderSection(headerInfo: .stub),
        HomeMainItemSection(mainInfo: .stub),
        HomeContentSection(contentInfo: .stub),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = "Home"
        
        collectionView.do {
            $0.collectionViewLayout = compositionalLayout
            $0.dataSource = self
            $0.delegate = self
            $0.register(cellType: HomeHeaderCollectionViewCell.self)
            $0.register(cellType: HomeMainItemCollectionViewCell.self)
            $0.register(cellType: HomeContentCollectionViewCell.self)
        }
    }

}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView, at: indexPath)
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
//    func collectionView(did)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].didSelectedItem(collectionView, at: indexPath)
    }
}
