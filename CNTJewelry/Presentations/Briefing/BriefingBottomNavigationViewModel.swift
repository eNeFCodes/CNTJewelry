//
//  BriefingBottomNavigationViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import Foundation
import Combine

class BriefingBottomNavigationViewModel: ObservableObject {
  @Published var buttons: [NavigationButtonItemModel]

  let publisher = PassthroughSubject<NavigationButtonItemModel, Never>()

  init(buttons: [NavigationButtonItemModel]) {
    self.buttons = buttons
  }
}

import SwiftUI
extension BriefingBottomNavigationViewModel {
  class func navigationButtons() -> [NavigationButtonItemModel] {
    [
      NavigationButtonItemModel(id: 0,
                                icon: Image("ic_star_white"),
                                activeIcon: Image("ic_star"),
                                title: "A LA UNE",
                                isActive: true),
      NavigationButtonItemModel(id: 1,
                                icon: Image("ic_eye_white"),
                                activeIcon: Image("ic_eye"),
                                title: "LIVE"),
      NavigationButtonItemModel(id: 2,
                                icon: Image("ic_resource_white"),
                                activeIcon: Image("ic_resource"),
                                title: "RESOURCES"),
      NavigationButtonItemModel(id: 3,
                                icon: Image("ic_plus"),
                                activeIcon: Image("ic_plus"),
                                title: "ADD",
                                bgColor: .orange)
    ]
  }
}
