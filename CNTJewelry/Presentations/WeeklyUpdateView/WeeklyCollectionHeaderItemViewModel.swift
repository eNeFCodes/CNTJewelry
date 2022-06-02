//
//  WeeklyCollectionHeaderItemViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import Foundation

class WeeklyCollectionHeaderItemViewModel: ObservableObject {
  let title: String

  init(title: String) {
    self.title = title
  }
}
