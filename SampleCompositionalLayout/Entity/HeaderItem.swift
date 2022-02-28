//
//  HeaderItem.swift
//  SampleCompositionalLayout
//
//  Created by 松丸真 on 2022/02/27.
//

import Foundation

struct HeaderInfo: InformationProtocol {
    var item: [ItemProtocol]
}

struct HeaderItem: ItemProtocol {
    var name: String
}


// MARK: -- HeaderInfo Stub
extension HeaderInfo {
    static var stub: Self {
        .init(
            item: [
                HeaderItem.header(id: 1),
                HeaderItem.header(id: 2),
                HeaderItem.header(id: 3),
                HeaderItem.header(id: 4),
                HeaderItem.header(id: 5),
                HeaderItem.header(id: 6),
            ]
        )
    }
}

// MARK: -- HeaderItem Stub
extension HeaderItem {
    static func header(id: Int) -> Self {
        return .init(name: "header: \(id)")
    }
}
