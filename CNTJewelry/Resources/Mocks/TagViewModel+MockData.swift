//
//  TagViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation

extension TagViewModel {
  static func mockData() -> TagViewModel {
    .init(id: 0,
          title: "FIND RESOURCE BY:",
          tags: [
            .init(id: 0, name: "Sales & Finance".uppercased(), isSelected: true),
            .init(id: 1, name: "Security".uppercased(), isSelected: false),
            .init(id: 2, name: "Stock Management".uppercased(), isSelected: false),
            .init(id: 3, name: "Client Service".uppercased(), isSelected: false),
            .init(id: 4, name: "A".uppercased(), isSelected: false),
            .init(id: 5, name: "B".uppercased(), isSelected: false),
            .init(id: 6, name: "C".uppercased(), isSelected: false),
            .init(id: 7, name: "D".uppercased(), isSelected: true)
          ])
  }
}
