//
//  TagSection.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation
import SwiftUI

class TagViewSection: ObservableObject, Identifiable {
  var section: Int
  @Published var rows: [TagViewRow]

  init(section: Int, rows: [TagViewRow]) {
    self.section = section
    self.rows = rows
  }

  func shouldDrawItemInNewSection(itemCanvasWidth: CGFloat, maxCanvasWidth: CGFloat, interItemPadding: CGFloat = 16) -> Bool {
    var rowItemWidth = rows.reduce(into: CGFloat.zero) { partialResult, tag in
      partialResult += tag.itemCanvas.width
    }
    let interItemSpacing = interItemPadding * CGFloat(rows.count)
    rowItemWidth += interItemSpacing
    rowItemWidth += itemCanvasWidth

    return rowItemWidth > maxCanvasWidth
  }

  func newRowIndex() -> Int {
    rows.count
  }
}
