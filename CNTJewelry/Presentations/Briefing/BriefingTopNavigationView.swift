//
//  BriefingTopNavigationView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/1/22.
//

import SwiftUI

struct BriefingTopNavigationView: View {
  @StateObject private var model: BriefingTopNavigationViewModel

  init(model: BriefingTopNavigationViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      let maxWidth = geometry.size.width
      buildTitleStack(estimatedWidth: maxWidth)
      buildButtonStack(estimatedWidth: maxWidth)

      VStack {
        Spacer()
        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: maxWidth, y: 0)
        ShapeView(withCoordinates: [p1, p2])
          .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
          .foregroundColor(ColorCollection.black)
          .frame(width: maxWidth, height: 1)
      }
      .frame(width: maxWidth, height: model.maxNavHeight, alignment: .bottom)
    }
    .padding(.horizontal, model.sidePadding)
    .frame(height: model.maxNavHeight, alignment: .bottom)
  }

  private func buildTitleStack(estimatedWidth: CGFloat) -> some View {
    HStack {
      let textContentWidth = abs(estimatedWidth - 148)
      VStack(spacing: 0) {
        let titleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 28))
        Text(model.title)
          .accessibilityLabel(model.title)
          .font(titleFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: textContentWidth, height: 30, alignment: .leading)

        let subTitleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.regular(size: 11))
        Text(model.subTitle)
          .accessibilityLabel(model.subTitle)
          .font(subTitleFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: textContentWidth, height:20, alignment: .leading)
      }
      .frame(width: textContentWidth, height: model.maxNavHeight, alignment: .topLeading)
      Spacer()
    }
    .frame(width: estimatedWidth, height: model.maxNavHeight, alignment: .leading)
  }

  private func buildButtonStack(estimatedWidth: CGFloat) -> some View {
    VStack {
      HStack(spacing: 16) {
        createButton(with: "ic_search_32x32_black") {
          model.triggerAction(for: .search)
        }
        createButton(with: "ic_profile_32x32_black") {
          model.triggerAction(for: .profile)
        }
      }
      Spacer()
    }
    .frame(width: estimatedWidth, height: model.maxNavHeight, alignment: .trailing)
  }

  private func createButton(with icon: String, action: @escaping () -> Void) -> some View {
    Button {
      action()
    } label: {
      Image(icon)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 32, height: 32, alignment: .center)
    }
  }
}

struct BriefingTopNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    BriefingTopNavigationView(model: .init(title: "CNT", subTitle: "JEWELRY"))
  }
}
