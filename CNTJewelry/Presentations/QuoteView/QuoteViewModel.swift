//
//  QuoteViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import Foundation
import SwiftUI

struct QuoteViewModel {
  let quotes: [Quote]
  @State var currentIndex: Int

  init(quotes: [Quote], currentIndex: Int = 0) {
    self.quotes = quotes
    self.currentIndex = currentIndex
  }
}
