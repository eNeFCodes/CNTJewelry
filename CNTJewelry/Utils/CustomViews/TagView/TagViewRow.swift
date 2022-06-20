//
//  TagViewRow.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation
import SwiftUI

class TagViewRow: ObservableObject {
  var index: Int
  @ObservedObject var item: TagItem
  let itemCanvas: CGSize

  init(index: Int = 0, item: TagItem, itemCanvas: CGSize) {
    self.index = index
    self.item = item
    self.itemCanvas = itemCanvas
  }

  func updateIndex(newIndex: Int) {
    index = newIndex
  }
}
