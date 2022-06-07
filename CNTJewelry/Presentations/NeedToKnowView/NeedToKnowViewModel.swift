//
//  NeedToKnowViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/1/22.
//

import Foundation

class NeedToKnowViewModel: ObservableObject {
  let title: String
  let knowTos: [NeedToKnowInfo]
  @Published var currentIndex: Int

  init(title: String, knowTos: [NeedToKnowInfo], currentIndex: Int = 0) {
    self.title = title
    self.knowTos = knowTos
    self.currentIndex = currentIndex
  }
}
