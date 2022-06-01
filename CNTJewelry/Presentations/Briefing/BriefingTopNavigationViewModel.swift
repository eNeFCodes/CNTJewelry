//
//  BriefingTopNavigationViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/1/22.
//

import Combine
import Foundation
import UIKit

extension BriefingTopNavigationViewModel {
  enum Action {
    case search
    case profile
  }
}

class BriefingTopNavigationViewModel: ObservableObject {
  let title: String
  let subTitle: String
  let sidePadding: CGFloat
  let maxNavHeight: CGFloat
  let publisher = PassthroughSubject<Action, Never>()

  init(title: String, subTitle: String, sidePadding: CGFloat = 32, maxNavHeight: CGFloat = 54) {
    self.title = title
    self.subTitle = subTitle
    self.sidePadding = sidePadding
    self.maxNavHeight = maxNavHeight
  }

  func triggerAction(for action: Action) {
    publisher.send(action)
  }
}
