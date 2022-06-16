//
//  PlayCardView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import SwiftUI

struct PlayCardView: View {
  private let model: PlayCardViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat = 32

  init(model: PlayCardViewModel, geometry: GeometryProxy) {
    self.model = model
    self.geometry = geometry
  }

  var body: some View {
    VStack(spacing: 0) {
      buildTopMaskedViewStack()
      buildTopViewStack()

      let contentHeight: CGFloat = 361
      ZStack {
        buildContentViewStack(contentHeight: contentHeight)

        VStack {
          let playSize = CGSize(width: 124, height: 125)
          VStack {
            Button {
              model.triggerPlayAction()
            } label: {
              let playFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
              Text(L10n.Shared.Content.play)
                .accessibilityLabel(L10n.Shared.Content.play)
                .foregroundColor(ColorCollection.red2)
                .font(playFont)
                .padding(.leading, padding)
                .frame(width: playSize.width, height: playSize.height, alignment: .leading)
            }
          }
          .background(ColorCollection.white)
          .frame(width: playSize.width, height: playSize.height, alignment: .center)
          .mask {
            GeometryReader { geometry in
              let p1 = CGPoint(x: 0, y: 0)
              let p2 = CGPoint(x: geometry.size.width, y: geometry.size.height / 2)
              let p3 = CGPoint(x: 0, y: geometry.size.height)
              ShapeView(withCoordinates: [p1, p2, p3],
                        shouldClosePath: true)
            }
          }
        }
        .padding(.bottom, 60)
        .frame(width: geometry.size.width, height: contentHeight, alignment: .bottomLeading)
      }
      .frame(width: geometry.size.width, height: contentHeight, alignment: .center)
    }
    .frame(width: geometry.size.width, height: 433, alignment: .center)
  }

  private func buildTopMaskedViewStack() -> some View {
    HStack {
      Rectangle()
        .foregroundColor(ColorCollection.red2)
        .frame(width: geometry.size.width - padding, height: 40, alignment: .leading)
        .mask {
          GeometryReader { geometry in
            let p1 = CGPoint(x: 0, y: 0)
            let p2 = CGPoint(x: geometry.size.width - 20, y: 0)
            let p3 = CGPoint(x: geometry.size.width, y: 20)
            let p4 = CGPoint(x: geometry.size.width, y: geometry.size.height)
            let p5 = CGPoint(x: 0, y: geometry.size.height)
            ShapeView(withCoordinates: [p1, p2, p3, p4, p5],
                      shouldClosePath: true)
          }
        }
    }
    .frame(width: geometry.size.width, height: 40, alignment: .leading)
  }

  private func buildTopViewStack() -> some View {
    Rectangle()
      .foregroundColor(ColorCollection.black)
      .frame(width: geometry.size.width, height: 32, alignment: .center)
  }

  private func buildContentViewStack(contentHeight: CGFloat) -> some View {
    VStack(spacing: 0) {
      Image(model.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: geometry.size.width, height: 239, alignment: .center)
        .clipped()

      VStack(spacing: 16) {
        let contentWidth = abs(geometry.size.width - 124 - padding)
        let textFont = FontCollection.FancyCutProB7.regular(size: 16).font
        Text(model.details)
          .accessibilityLabel(model.details)
          .foregroundColor(ColorCollection.white)
          .font(textFont)
          .frame(width: contentWidth, alignment: .trailing)
          .multilineTextAlignment(.trailing)

        let durationFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
        let formattedDuration = model.duration.formattedDuration.uppercased()
        Text(formattedDuration)
          .accessibilityLabel(formattedDuration)
          .foregroundColor(ColorCollection.white)
          .font(durationFont)
          .frame(width: contentWidth, alignment: .trailing)
          .multilineTextAlignment(.trailing)
      }
      .padding(.horizontal, padding)
      .frame(width: geometry.size.width, height: 122, alignment: .trailing)
      .background(ColorCollection.black)
    }
    .frame(width: geometry.size.width, height: contentHeight, alignment: .trailing)
  }
}

struct PlayCardView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      PlayCardView(model: .init(imageName: "img_result9",
                                details: "Jean Cocteau and the story behind Cartier Trinity ring.",
                                duration: 223),
                   geometry: geometry)
    }
  }
}
