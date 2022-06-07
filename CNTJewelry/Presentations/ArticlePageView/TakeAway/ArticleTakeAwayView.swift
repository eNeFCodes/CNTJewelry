//
//  ArticleTakeAwayView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import SwiftUI

struct ArticleTakeAwayView: View {
  private let model: ArticleTakeAwayViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: ArticleTakeAwayViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack(spacing: 24) {
      buildHeaderViewStack()
      buildInfoDetailViewStack()
      buildKeyTakeAwayViewStack()
    }
    .ignoresSafeArea()
  }

  private func buildHeaderViewStack() -> some View {
    VStack(spacing: 8) {
      let textContentWidth = abs(geometry.size.width - (padding * 2))

      let miniTitleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      Text(model.miniTitle)
        .font(miniTitleFont)
        .foregroundColor(ColorCollection.white)
        .frame(width: textContentWidth, alignment: .leading)

      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 28).font
      Text(model.title)
        .font(titleFont)
        .foregroundColor(ColorCollection.white)
        .frame(width: textContentWidth, alignment: .leading)
    }
    .padding(.horizontal, padding)
    .padding(.top, model.hasImage ? 265 : 91)
    .padding(.bottom, 40)
    .frame(width: geometry.size.width, alignment: .leading)
    .background {
      GeometryReader { geometry in
        if let imageName = model.image {
          Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
            .clipped()
        } else {
          Image("img_bg_article")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
            .clipped()
        }
      }
    }
  }

  @ViewBuilder
  private func buildInfoDetailViewStack() -> some View {
    let extraContentPadding: CGFloat = 24
    VStack(spacing: 24) {
      let textContentWidth = abs(geometry.size.width - (padding * 2) - extraContentPadding)

      VStack(spacing: 4) {
        let infoDateFont = FontCollection.FancyCutProB7.bold(size: 14).font
        Text(model.infoDate)
          .accessibilityLabel(model.infoDate)
          .font(infoDateFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: textContentWidth, alignment: .leading)

        let infoAuthorFont = FontCollection.FancyCutProB7.regular(size: 14).font
        Text(model.infoAuthor)
          .accessibilityLabel(model.infoAuthor)
          .font(infoAuthorFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: textContentWidth, alignment: .leading)

        let infoLocationFont = FontCollection.FancyCutProB7.bold(size: 14).font
        Text(model.infoLocation)
          .accessibilityLabel(model.infoLocation)
          .font(infoLocationFont)
          .foregroundColor(ColorCollection.black)
          .frame(width: textContentWidth, alignment: .leading)
      }

      let infoDetailFont = FontCollection.FancyCutProB7.light(size: 29).font
      Text(model.infoDetail)
        .accessibilityLabel(model.infoDetail)
        .font(infoDetailFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: textContentWidth, alignment: .leading)
    }
    .padding(.horizontal, padding)
    .padding(.leading, extraContentPadding)
    .frame(width: geometry.size.width, alignment: .leading)
    .background {
      GeometryReader { geometry in
        let p1 = CGPoint(x: padding, y: 0)
        let p2 = CGPoint(x: padding, y: geometry.size.height)
        ShapeView(withCoordinates: [p1, p2])
          .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
          .foregroundColor(ColorCollection.gold)
          .frame(width: 1, height: geometry.size.height, alignment: .leading)
      }
    }
  }

  private func buildKeyTakeAwayViewStack() -> some View {
    VStack(spacing: 16) {
      let textContentWidth = abs(geometry.size.width - (padding * 2))

      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      Text(model.takeAwayTitle)
        .accessibilityLabel(model.takeAwayTitle)
        .font(titleFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: textContentWidth, alignment: .leading)

      LazyVStack(spacing: 24) {
        let numberFont = FontCollection.FancyCutCondProB7.bold(size: 44).font
        let detailsFont = FontCollection.FancyCutCondProB7.medium(size: 18).font
        let numberContentWidth: CGFloat = 50
        let estimatedContentWidth = abs(textContentWidth - numberContentWidth - 8)

        ForEach(model.takeAways, id: \.id) { takeAway in
          HStack(spacing: 8) {
            Text(takeAway.number)
              .accessibilityLabel(takeAway.number)
              .foregroundColor(ColorCollection.red)
              .font(numberFont)
              .frame(width: 50, alignment: .center)

            Text(takeAway.detail)
              .accessibilityLabel(takeAway.detail)
              .foregroundColor(.black)
              .font(detailsFont)
              .frame(width: estimatedContentWidth, alignment: .leading)
          }
        }
      }
      .frame(width: textContentWidth, alignment: .leading)
    }
    .padding(.top, 24)
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }
}

struct ArticleTakeAwayView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ArticleTakeAwayView(model: ArticleTakeAwayViewModel.mockImageData(),
                          geometry: geometry)
    }
  }
}
