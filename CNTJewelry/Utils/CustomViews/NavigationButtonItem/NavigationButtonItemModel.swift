//
//  NavigationButtonItemModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import Combine
import SwiftUI

class NavigationButtonItemModel: ObservableObject {
  let id: Int
  let icon: Image
  let activeIcon: Image
  let title: String
  let titleColor: Color
  let bgColor: Color
  let activeBGColor: Color
  let strokeColor: Color
  let activeStrokeColor: Color
  let iconSize: CGSize
  let cornerRadius: CGFloat
  @Published var isActive: Bool

  let publisher = PassthroughSubject<NavigationButtonItemModel, Never>()

  init(id: Int,
       icon: Image,
       activeIcon: Image,
       title: String,
       titleColor: Color = ColorCollection.black,
       bgColor: Color = ColorCollection.black,
       activeBGColor: Color = ColorCollection.white,
       strokeColor: Color = ColorCollection.white,
       activeStrokeColor: Color = ColorCollection.black,
       iconSize: CGSize = CGSize(width: 40, height: 40),
       cornerRadius: CGFloat = 30,
       isActive: Bool = false) {

    self.id = id
    self.icon = icon
    self.activeIcon = activeIcon
    self.title = title
    self.titleColor = titleColor
    self.bgColor = bgColor
    self.activeBGColor = activeBGColor
    self.strokeColor = strokeColor
    self.activeStrokeColor = activeStrokeColor
    self.iconSize = iconSize
    self.cornerRadius = cornerRadius
    self.isActive = isActive
  }

  func triggerAction() {
    publisher.send(self)
  }
}
