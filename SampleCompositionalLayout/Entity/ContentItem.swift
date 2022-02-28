//
//  ContentItem.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import Foundation

struct ContentInfo: InformationProtocol {
    var item: [ItemProtocol]
}

struct ContentItem: ItemProtocol {
    var name: String
}


// MARK: -- MainInfo Stub
extension ContentInfo {
    static var stub: Self {
        .init(
            item: [
                ContentItem.item(id: 1),
                ContentItem.item(id: 2),
                ContentItem.item(id: 3),
                ContentItem.item(id: 4),
                ContentItem.item(id: 5),
                ContentItem.item(id: 6),
                ContentItem.item(id: 7),
                ContentItem.item(id: 8),
                ContentItem.item(id: 9),
            ]
        )
    }
}

// MARK: -- ContentItem Stub
extension ContentItem {
    static func item(id: Int) -> Self {
        return .init(name: "content: \(id)")
    }
}
