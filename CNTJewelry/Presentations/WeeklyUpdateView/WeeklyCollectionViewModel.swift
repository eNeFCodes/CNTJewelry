//
//  WeeklyCollectionViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

protocol WeeklyCollectionItemModelProtocol {
  var viewId: UUID { get }
  var type: WeeklyCollectionViewModel.ContentType { get }
}

extension WeeklyCollectionViewModel {
  enum ContentType {
    case variant1 // simple
    case variant2 // full image
    case variant3 // text details only
  }
}

class WeeklyCollectionViewModel: ObservableObject {
  let header: WeeklyCollectionHeaderItemViewModel
  let items: [WeeklyCollectionItemModelProtocol]

  init(header: WeeklyCollectionHeaderItemViewModel, items: [WeeklyCollectionItemModelProtocol]) {
    self.header = header
    self.items = items
  }
}
