//
//  CollectionShowcaseView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/17/22.
//

import SwiftUI

struct CollectionShowcaseView: View {
  private let model: CollectionShowcaseViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: CollectionShowcaseViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack(spacing: 0) {
      buildTextContentViewStack()
        .background {
          GeometryReader { geometry in
            VStack {
              buildThumbBGViewStack()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottomTrailing)
          }
        }

      buildButtonViewStack()
    }
    .padding(.top, 40)
    .padding(.bottom, 24)
    .frame(width: geometry.size.width, alignment: .leading)
    .background(ColorCollection.red)
    .overlay {
      GeometryReader { geometry in
        buildOverlayImageViewStack(geometry: geometry)
      }
    }
  }

  @ViewBuilder
  private func buildTextContentViewStack() -> some View {
    HStack {
      let contentViewWidth = abs(geometry.size.width - padding)
      VStack(spacing: 16) {
        let textContentWidth = contentViewWidth - (padding * 2)
        let miniTitleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
        Text(model.miniTitle)
          .accessibilityLabel(model.miniTitle)
          .foregroundColor(ColorCollection.white)
          .font(miniTitleFont)
          .frame(width: textContentWidth, alignment: .leading)

        let titleFont = FontCollection.BrilliantCutProB7.medium(size: 28).font
        Text(model.title)
          .accessibilityLabel(model.title)
          .foregroundColor(ColorCollection.white)
          .font(titleFont)
          .frame(width: textContentWidth, alignment: .leading)

        let bodyTextFont = FontCollection.FancyCutProB7.light(size: 29).font
        Text(model.details)
          .accessibilityLabel(model.details)
          .foregroundColor(ColorCollection.white)
          .font(bodyTextFont)
          .frame(width: textContentWidth, alignment: .leading)
      }
      .padding(.top, padding)
      .padding(.bottom, 120)
      .padding(.horizontal, padding)
      .frame(width: contentViewWidth, alignment: .center)
      .background(ColorCollection.red)
      .overlay {
        GeometryReader { geometry in
          let curve: CGFloat = 20
          let p1 = CGPoint(x: 0, y: 0)
          let p2 = CGPoint(x: geometry.size.width - curve, y: 0)
          let p3 = CGPoint(x: geometry.size.width, y: curve)
          let p4 = CGPoint(x: geometry.size.width, y: geometry.size.height - curve)
          let p5 = CGPoint(x: geometry.size.width - curve, y: geometry.size.height)
          let p6 = CGPoint(x: 0, y: geometry.size.height)
          ShapeView(withCoordinates: [p1, p2, p3, p4, p5, p6])
            .stroke(ColorCollection.gold, lineWidth: 1)
        }
      }
    }
    .padding(.bottom, 100)
    .frame(width: geometry.size.width, alignment: .leading)
  }

  private func buildThumbBGViewStack() -> some View {
    HStack {
      ColorCollection.red
      .frame(width: geometry.size.width / 2, height: 280, alignment: .center)
      .background(ColorCollection.red)
      .overlay {
        GeometryReader { geometry in
          let curve: CGFloat = 20
          let p1 = CGPoint(x: geometry.size.width, y: 0)
          let p2 = CGPoint(x: 0, y: 0)
          let p3 = CGPoint(x: 0, y: geometry.size.height - curve)
          let p4 = CGPoint(x: curve, y: geometry.size.height)
          let p5 = CGPoint(x: geometry.size.width, y: geometry.size.height)
          ShapeView(withCoordinates: [p1, p2, p3, p4, p5])
            .stroke(ColorCollection.gold, lineWidth: 1)
        }
      }
    }
    .frame(width: geometry.size.width, alignment: .trailing)
  }

  private func buildOverlayImageViewStack(geometry: GeometryProxy) -> some View {
    VStack {
      HStack(alignment: .top, spacing: 0) {
        Image(model.productImage)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 180, height: 180, alignment: .center)

        Spacer(minLength: 0)

        Image(model.productThumb)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 72, height: 72, alignment: .center)
          .padding(.top, 24)
      }
      .padding(.leading, 16)
      .padding(.trailing, padding * 2)
      .padding(.bottom, 68)
      .frame(width: geometry.size.width, alignment: .top)
    }
    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
  }

  private func buildButtonViewStack() -> some View {
    HStack {
      Button {
        model.viewCollectionAction()
      } label: {
        HStack {
          let font = FontCollection.BrilliantCutProB7.bold(size: 10).font
          Text(L10n.Shared.Content.viewCollection)
            .accessibilityLabel(L10n.Shared.Content.viewCollection)
            .foregroundColor(ColorCollection.white)
            .font(font)
          Image("ic_arrow_right_white")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 21, alignment: .center)
        }
      }
    }
    .padding(.top, 40)
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }
}

struct CollectionShowcaseView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      CollectionShowcaseView(model: CollectionShowcaseViewModel.mockData(),
                             geometry: geometry)
    }
  }
}
