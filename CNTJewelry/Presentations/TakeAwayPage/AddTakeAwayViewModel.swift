//
//  AddTakeAwayViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import Foundation
import Combine

class AddTakeAwayViewModel: ObservableObject {
  @Published var title: String
  @Published var text: String
  @Published var isChecked: Bool
  let maxTextCount: Int

  var cancellables = Set<AnyCancellable>()

  init(title: String = "",
       text: String = "",
       maxTextCount: Int = 280,
       isChecked: Bool = false) {
    self.title = title
    self.text = text
    self.maxTextCount = maxTextCount
    self.isChecked = isChecked

    text.publisher
      .sink { chnge in
        print("text: ", chnge)
      }
      .store(in: &cancellables)
  }
}

extension AddTakeAwayViewModel {
  var remainingTextCount: Int {
    let count = maxTextCount - text.count
    return count < 0 ? 0 : count
  }
}
