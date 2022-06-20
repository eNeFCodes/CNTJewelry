//
//  TagItem.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation

class TagItem: ObservableObject, Identifiable {
    let id: Int
    let name: String
    @Published var isSelected: Bool

    init(id: Int, name: String, isSelected: Bool = false) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}
