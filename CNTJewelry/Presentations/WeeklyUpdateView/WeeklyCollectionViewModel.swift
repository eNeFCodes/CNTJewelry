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
    case variant3 // simple with backdrop image
    case variant4 // text details only
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

extension WeeklyCollectionViewModel {
  class func mockItems() -> [WeeklyCollectionItemModelProtocol] {
    [
      WeeklyCollectionItemViewModel(title: "EVENT",
                                    subTitle: "NEW BAIGNOIRE COLLECTION",
                                    imageName: "img_result1",
                                    date: "MAR 1, 2020")
    ]
  }
}
