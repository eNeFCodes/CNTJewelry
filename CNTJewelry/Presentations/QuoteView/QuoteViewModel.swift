//
//  QuoteViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation
import SwiftUI

class QuoteViewModel: ObservableObject {
  let quotes: [Quote]
  @Published var currentIndex: Int

  init(quotes: [Quote], currentIndex: Int = 0) {
    self.quotes = quotes
    self.currentIndex = currentIndex
  }
}
