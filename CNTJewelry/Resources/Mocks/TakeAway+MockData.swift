//
//  TakeAway+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import Foundation

extension TakeAwayTypeViewModel {
  static var stub: TakeAwayTypeViewModel {
    .init(items: TakeAwayTypeViewModel.stubTypes)
  }

  static var stubTypes: [TakeAwayTypeItemViewModel] {
    [
      .init(title: "Did You Know"),
      .init(title: "Sales Tip"),
      .init(title: "Shout-out"),
      .init(title: "Takeaway"),
      .init(title: "The Red Carpet"),
      .init(title: "Speak Cartier")
    ]
  }
}

extension TakeAwayTypeItemViewModel {
  static var stub: TakeAwayTypeItemViewModel {
    .init(title: "Did You Know")
  }
}
