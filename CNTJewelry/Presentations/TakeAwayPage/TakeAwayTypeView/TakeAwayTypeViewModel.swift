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

  init(title: String,
       items: [TakeAwayTypeItemViewModel],
       isMultipleSelectionEnabled: Bool = true) {
    self.title = title
    self.items = items
    self.isMultipleSelectionEnabled = isMultipleSelectionEnabled
  }
}

extension TakeAwayTypeViewModel {
  func toggleItemSelected(_ selected: TakeAwayTypeItemViewModel) {
    if isMultipleSelectionEnabled {
      selected.isSelected.toggle()
    } else {
      for item in items {
        item.isSelected = item.id == selected.id
      }
    }
  }
}
