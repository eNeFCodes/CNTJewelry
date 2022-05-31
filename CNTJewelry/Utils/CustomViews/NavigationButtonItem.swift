//
//  NavigationButtonItem.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import SwiftUI

struct NavigationButtonItem: View {
  @ObservedObject private var model: NavigationButtonItemModel

  init(model: NavigationButtonItemModel) {
    self.model = model
  }

  var body: some View {
    Button {
      model.triggerAction()
    } label: {
      HStack {
        if model.isActive {
          model.activeIcon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: model.iconSize.width, height: model.iconSize.height, alignment: .center)
            .padding(.leading, 10)

          let font = FontCollection.FancyCutCondProB7.bold(size: 20).font
          Text(model.title)
            .accessibilityLabel(model.title)
            .foregroundColor(model.titleColor)
            .font(font)
            .padding(.trailing, 10)
        } else {
          model.icon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: model.iconSize.width, height: model.iconSize.height, alignment: .center)
        }
      }
      .padding(10)
      .background(model.isActive ? model.activeBGColor : model.bgColor)
      .cornerRadius(model.cornerRadius)
      .overlay {
        GeometryReader { geometry in
          let cornerRadius = abs(geometry.size.height) / 2
          let rect = CGRect(x: 0, y: 0, width: abs(geometry.size.width), height: abs(geometry.size.height))
          let roundedPath = Path(roundedRect: rect, cornerRadius: cornerRadius, style: .continuous)
          ShapeView(path: roundedPath)
            .stroke(model.isActive ? model.activeStrokeColor : model.strokeColor, lineWidth: 1)
        }
      }
    }
    .tag(model.id)
  }
}

struct NavigationButtonView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationButtonItem(model: .init(id: 0,
                                      icon: Image("ic_star_white"),
                                      activeIcon: Image("ic_star"),
                                      title: "A LA UNE",
                                      isActive: true))
  }
}
