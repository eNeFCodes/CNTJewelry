//
//  FTUEViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import SwiftUI

protocol FTUEViewContentItemProtocol {
    var id: Int { get }
    var type: FTUEViewModel.FTUEViewContentItemType { get }
}

class FTUEViewModel: ObservableObject {

    enum FTUEViewContentItemType {
        case intro
        case showcase
    }

    let items: [FTUEViewContentItemProtocol]
    @Published var activeIndex: Int

    init(items: [FTUEViewContentItemProtocol], activeIndex: Int = 0) {
        self.items = items
        self.activeIndex = activeIndex
    }
}
