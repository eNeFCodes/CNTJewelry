//
//  PlayCardViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import Foundation

struct PlayCardViewModel {
  let imageName: String
  let details: String
  let duration: TimeInterval

  init(imageName: String, details: String, duration: TimeInterval) {
    self.imageName = imageName
    self.details = details
    self.duration = duration
  }
}

extension PlayCardViewModel {
  func triggerPlayAction() {
    
  }
}
