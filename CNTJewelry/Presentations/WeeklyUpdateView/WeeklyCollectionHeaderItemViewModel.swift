//
//  WeeklyCollectionHeaderItemViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

class WeeklyCollectionHeaderItemViewModel: ObservableObject {
  let title: String
  let enableBackdrop: Bool

  init(title: String, enableBackdrop: Bool = true) {
    self.title = title
    self.enableBackdrop = enableBackdrop
  }
}
