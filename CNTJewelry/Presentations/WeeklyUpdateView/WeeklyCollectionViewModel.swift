//
//  WeeklyCollectionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

protocol WeeklyCollectionItemModelProtocol {
  var viewId: UUID { get }
}

class WeeklyCollectionViewModel: ObservableObject {
  let items: [WeeklyCollectionItemModelProtocol]

  init(items: [WeeklyCollectionItemModelProtocol]) {
    self.items = items
  }
}
