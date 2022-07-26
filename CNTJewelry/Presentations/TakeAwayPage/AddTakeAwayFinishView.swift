//
//  AddTakeAwayFinishView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/25/22.
//

import SwiftUI

struct AddTakeAwayFinishView: View {
  @Environment(\.presentationMode) private var presentationMode
  private let padding: CGFloat = 32

  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        buildTopNavigationViewStack(geometry: geometry)
        buildContentViewStack(geometry: geometry)

        let contentWidth = abs(geometry.size.width - (padding * 2))
        CTAButton(backgroundColor: ColorCollection.red,
                  isBorderEnabled: false,
                  size: .init(width: contentWidth, height: CTAButton.DefaultHeight)) {
          presentationMode.wrappedValue.dismiss()
        }
      }
      .padding(.bottom, 32)
      .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
      .background(ColorCollection.black)
    }
    .ignoresSafeArea()
    .navigationBarHidden(true)
  }

  private func buildTopNavigationViewStack(geometry: GeometryProxy) -> some View {
    HStack {
      let contentWidth = abs(geometry.size.width - 96)
      VStack(alignment: .leading, spacing: 22) {
        Text(L10n.TakeAway.Navigation.addTakeAwayTitle)
          .accessibilityLabel(L10n.TakeAway.Navigation.addTakeAwayTitle)
          .foregroundColor(ColorCollection.black)
          .font(FontCollection.BrilliantCutProB7.medium(size: 22).font)
      }
      .padding(padding)
      .padding(.top, 10)
      .frame(minWidth: contentWidth, minHeight: 92, alignment: .topLeading)
      .background(ColorCollection.white)
      .mask {
        GeometryReader { geometry in
          let curve: CGFloat = 20
          let p0 = CGPoint(x: 0, y: 0)
          let p1 = CGPoint(x: geometry.size.width, y: 0)
          let p2 = CGPoint(x: geometry.size.width, y: geometry.size.height - curve)
          let p3 = CGPoint(x: geometry.size.width - curve, y: geometry.size.height)
          let p4 = CGPoint(x: 0, y: geometry.size.height)
          ShapeView(withCoordinates: [p0, p1, p2, p3, p4], shouldClosePath: true)
        }
      }
    }
    .frame(width: geometry.size.width, alignment: .leading)
  }

  private func buildContentViewStack(geometry: GeometryProxy) -> some View {
    VStack(spacing: 0) {
      Spacer(minLength: 0)

      let contentWidth = abs(geometry.size.width - (padding * 2))
      VStack {
        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: contentWidth, y: 0)
        ShapeView(withCoordinates: [p1, p2])
          .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [2]))
          .foregroundColor(ColorCollection.goldSeparator)
      }
      .frame(width: contentWidth, height: 1, alignment: .center)

      VStack(spacing: 16) {
        Text(L10n.TakeAway.EndContent.title1)
          .font(FontCollection.BrilliantCutProB7.medium(size: 28).font)
          .combine(with: [
            Text(L10n.TakeAway.EndContent.title2)
              .font(FontCollection.FancyCutProB7.light(size: 29).font),
            Text(L10n.TakeAway.EndContent.title3)
              .font(FontCollection.FancyCutProB7.medium(size: 29).font)
          ])
          .foregroundColor(ColorCollection.white)
          .multilineTextAlignment(.center)
      }
      .padding(.vertical, 40)

      VStack {
        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: contentWidth, y: 0)
        ShapeView(withCoordinates: [p1, p2])
          .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [2]))
          .foregroundColor(ColorCollection.goldSeparator)
      }
      .frame(width: contentWidth, height: 1, alignment: .center)

      Spacer(minLength: 0)
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .bottom)
  }
}

struct AddTakeAwayFinishView_Previews: PreviewProvider {
  static var previews: some View {
    AddTakeAwayFinishView()
  }
}
