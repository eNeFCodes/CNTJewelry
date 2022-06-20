//
//  TagViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation
import SwiftUI

class TagViewModel: ObservableObject, Equatable {
  static func == (lhs: TagViewModel, rhs: TagViewModel) -> Bool {
    return lhs.id == rhs.id
  }

  let id: Int
  let title: String?
  let titleFont: UIFont
  @Published var tags: [TagItem]
  @Published var sections: [TagViewSection] = []
  var maxCanvasWidth: CGFloat
  var minCanvasHeight: CGFloat
  var padding: CGFloat

  init(id: Int,
       title: String,
       titleFont: UIFont = FontCollection.BrilliantCutProB7.bold(size: 11).uiFont,
       tags: [TagItem],
       maxCanvasWidth: CGFloat = TagView.MaxCanvasWidth,
       minCanvasHeight: CGFloat = 32,
       padding: CGFloat = 16) {

    self.id = id
    self.title = title
    self.titleFont = titleFont
    self.tags = tags

    self.maxCanvasWidth = maxCanvasWidth
    self.minCanvasHeight = minCanvasHeight
    self.padding = padding

    buildSections(maxCanvasWidth: maxCanvasWidth, minCanvasHeight: minCanvasHeight, padding: padding)
  }

  func updateSelected(with t: TagItem) {
    tags = tags.map { tag in
      let isSelected = tag.id == t.id
      tag.isSelected = isSelected
      return tag
    }
  }

  private func buildSections(maxCanvasWidth: CGFloat = TagView.MaxCanvasWidth, minCanvasHeight: CGFloat = 32, padding: CGFloat = 16) {
    sections = []
    let estimatedWidth = maxCanvasWidth - (padding * 2)
    let attributes: [NSAttributedString.Key: Any] = [.font: titleFont]

    for tag in tags {
      let resultSize = tag.name.constrainedSize(inCanvas: .init(width: estimatedWidth, height: .infinity),
                                                minHeight: minCanvasHeight,
                                                attributes: attributes)
      let resultWidth = resultSize.width + (padding * 2)
      let tagItem = TagViewRow(item: tag,
                               itemCanvas: .init(width: resultWidth, height: resultSize.height))

      if let lastSection = sections.last {
        if lastSection.shouldDrawItemInNewSection(itemCanvasWidth: resultWidth, maxCanvasWidth: maxCanvasWidth) {
          let newSection = TagViewSection(section: sections.count, rows: [tagItem])
          sections.append(newSection)
        } else {
          tagItem.updateIndex(newIndex: lastSection.newRowIndex())
          lastSection.rows.append(tagItem)
        }
      } else {
        let newSection = TagViewSection(section: sections.count, rows: [tagItem])
        sections.append(newSection)
      }
    }
  }
}

extension TagView {
  static var MaxCanvasWidth: CGFloat {
    UIScreen.main.bounds.size.width - 64
  }
}
