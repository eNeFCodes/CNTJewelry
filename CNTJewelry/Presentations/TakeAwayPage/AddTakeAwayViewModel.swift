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
  let maxTextCount: Int
  @Published var isTransparentImage: Bool
  @Published var showTimestamp: Bool
  @Published var sendToCentralQueue: Bool
  let submitTitleLabel: String
  @Published var canSubmit: Bool

  var cancellables = Set<AnyCancellable>()

  init(title: String = "",
       text: String = "",
       maxTextCount: Int = 280,
       isTransparentImage: Bool = false,
       showTimestamp: Bool = false,
       sendToCentralQueue: Bool = false,
       submitTitleLabel: String = "You are publishing to 5th Avenue Mansion",
       canSubmit: Bool = false) {
    self.title = title
    self.text = text
    self.maxTextCount = maxTextCount

    self.isTransparentImage = isTransparentImage
    self.showTimestamp = showTimestamp
    self.sendToCentralQueue = sendToCentralQueue
    self.submitTitleLabel = submitTitleLabel
    self.canSubmit = canSubmit

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
