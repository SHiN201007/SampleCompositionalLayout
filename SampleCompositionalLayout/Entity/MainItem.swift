//
//  MainItem.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import Foundation

struct MainInfo: InformationProtocol {
    var item: [ItemProtocol]
}

struct MainItem: ItemProtocol {
    var name: String
}


// MARK: -- MainInfo Stub
extension MainInfo {
    static var stub: Self {
        .init(
            item: [
                MainItem.main(id: 1),
                MainItem.main(id: 2),
                MainItem.main(id: 3),
                MainItem.main(id: 4),
                MainItem.main(id: 5),
                MainItem.main(id: 6),
                MainItem.main(id: 7),
                MainItem.main(id: 8),
                MainItem.main(id: 9),
            ]
        )
    }
}

// MARK: -- MainItem Stub
extension MainItem {
    static func main(id: Int) -> Self {
        return .init(name: "main: \(id)")
    }
}
