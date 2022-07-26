//
//  AddTakeAwayViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import Foundation
import Combine
import SwiftUI

extension AddTakeAwayViewModel {
  typealias Media = ImagePickerViewModel.Media
}

class AddTakeAwayViewModel: ObservableObject {
  @Published var title: String
  @Published var text: String
  let maxTextCount: Int
  @Published var attachment: Media?
  @Published var isTransparentImage: Bool
  @Published var showTimestamp: Bool
  @Published var sendToCentralQueue: Bool
  let submitTitleLabel: String
  @Published var types: [TakeAwayTypeItemViewModel]
  @Published var topics: [TakeAwayTypeItemViewModel]
  @Published var otherTopics: [TakeAwayTypeItemViewModel]

  var cancellables = Set<AnyCancellable>()

  init(title: String = "",
       text: String = "",
       maxTextCount: Int = 280,
       attachment: Media? = nil,
       isTransparentImage: Bool = false,
       showTimestamp: Bool = false,
       sendToCentralQueue: Bool = false,
       submitTitleLabel: String = "You are publishing to 5th Avenue Mansion",
       types: [TakeAwayTypeItemViewModel] = [],
       topics: [TakeAwayTypeItemViewModel] = [],
       otherTopics: [TakeAwayTypeItemViewModel] = []) {

    self.title = title
    self.text = text
    self.maxTextCount = maxTextCount

    self.attachment = attachment
    self.isTransparentImage = isTransparentImage
    self.showTimestamp = showTimestamp
    self.sendToCentralQueue = sendToCentralQueue
    self.submitTitleLabel = submitTitleLabel
    self.types = types
    self.topics = topics
    self.otherTopics = otherTopics
  }
}

extension AddTakeAwayViewModel {
  var canSubmit: Bool {
    if !text.isEmpty ||
        attachment != nil ||
        !types.isEmpty ||
        !topics.isEmpty ||
        !otherTopics.isEmpty {
      return true
    }

    return true // test
  }

  var remainingTextCount: Int {
    let count = maxTextCount - text.count
    return count < 0 ? 0 : count
  }
}

extension AddTakeAwayViewModel {
  func submitAction() {
    print("Submit: ", text)
  }
}
