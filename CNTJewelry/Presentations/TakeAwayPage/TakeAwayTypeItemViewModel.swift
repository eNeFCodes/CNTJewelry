//
//  TakeAwayTypeItemViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import Foundation

class TakeAwayTypeItemViewModel: ObservableObject {
  let id: UUID
  let title: String
  @Published var isSelected: Bool

  init(title: String,
       isSelected: Bool = false) {
    self.id = UUID()
    self.title = title
    self.isSelected = isSelected
  }
}
