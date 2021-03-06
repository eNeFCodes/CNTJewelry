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

  private var subscriptions = Set<AnyCancellable>()
  let publisher = PassthroughSubject<NavigationButtonItemModel, Never>()

  init(buttons: [NavigationButtonItemModel]) {
    self.buttons = buttons

    setBindings()
  }

  private func setBindings() {
    let mergedPublishers = buttons.reduce(Publishers.MergeMany<PassthroughSubject<NavigationButtonItemModel, Never>>()) { partialResult, btnItem in
      partialResult.merge(with: btnItem.publisher)
    }

    mergedPublishers
      .sink { [weak self] btnItem in
        guard let self = self else { return }
        self.updateActiveButtonItem(with: btnItem)
      }
      .store(in: &subscriptions)
  }

  private func updateActiveButtonItem(with btnItem: NavigationButtonItemModel) {
    buttons.forEach({ item in
      item.isActive = item.id == btnItem.id
    })
    publisher.send(btnItem)
  }
}

import SwiftUI
extension BriefingBottomNavigationViewModel {
  class func navigationButtons() -> [NavigationButtonItemModel] {
    [
      NavigationButtonItemModel(id: 0,
                                icon: Image("ic_star_white"),
                                activeIcon: Image("ic_star"),
                                title: L10n.Briefing.Navigation.btnTitleALaUne,
                                isActive: true),
      NavigationButtonItemModel(id: 1,
                                icon: Image("ic_eye_white"),
                                activeIcon: Image("ic_eye"),
                                title: L10n.Briefing.Navigation.btnTitleLive),
      NavigationButtonItemModel(id: 2,
                                icon: Image("ic_resource_white"),
                                activeIcon: Image("ic_resource"),
                                title: L10n.Briefing.Navigation.btnTitleResources),
      NavigationButtonItemModel(id: 3,
                                icon: Image("ic_plus"),
                                activeIcon: Image("ic_plus"),
                                title: L10n.Briefing.Navigation.btnTitleAdd,
                                bgColor: .orange)
    ]
  }
}
