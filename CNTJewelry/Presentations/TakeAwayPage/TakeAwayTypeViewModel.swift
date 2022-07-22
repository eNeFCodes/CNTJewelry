//
//  TakeAwayTypeViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import Foundation

class TakeAwayTypeViewModel: ObservableObject {
  var items: [TakeAwayTypeItemViewModel]

  init(items: [TakeAwayTypeItemViewModel]) {
    self.items = items
  }
}
