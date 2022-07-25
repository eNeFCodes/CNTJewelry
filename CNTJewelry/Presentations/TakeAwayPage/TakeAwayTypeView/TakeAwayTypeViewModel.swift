//
//  TakeAwayTypeViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import Foundation

class TakeAwayTypeViewModel: ObservableObject {
  let title: String
  @Published var items: [TakeAwayTypeItemViewModel]
  let isMultipleSelectionEnabled: Bool
  let limit: Int

  init(title: String,
       items: [TakeAwayTypeItemViewModel],
       isMultipleSelectionEnabled: Bool = true,
       limit: Int = 0) {
    self.title = title
    self.isMultipleSelectionEnabled = isMultipleSelectionEnabled
    self.limit = limit
    self.items = items
  }
}

extension TakeAwayTypeViewModel {
  func updateActiveSelection(with activeSelections: [TakeAwayTypeItemViewModel] = []) {
    items = items.map({ item in
      for activeSelection in activeSelections where activeSelection.id == item.id {
        item.isSelected = true
      }
      return item
    })
  }

  func toggleItemSelected(_ selected: TakeAwayTypeItemViewModel) {
    if isMultipleSelectionEnabled {
      if limit > 0 {
        var selectedCount: Int = 0
        for item in items where item.isSelected {
          selectedCount += 1
        }
        if selectedCount < limit {
          selected.isSelected.toggle()
        } else {
          selected.isSelected = false
        }
      } else {
        selected.isSelected.toggle()
      }

    } else {
      for item in items {
        item.isSelected = item.id == selected.id
      }
    }
  }
}
