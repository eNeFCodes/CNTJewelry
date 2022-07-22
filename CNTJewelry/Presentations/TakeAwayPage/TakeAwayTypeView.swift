//
//  TakeAwayTypeView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import SwiftUI

struct TakeAwayTypeView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var model: TakeAwayTypeViewModel
  private let padding: CGFloat = 32
  @State private var isAlertActive: Bool = false

  init(model: TakeAwayTypeViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        buildTopNavigationViewStack(geometry: geometry)
        buildContentViewStack(geometry: geometry)
      }
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
        Button {
          isAlertActive = true
        } label: {
          Image("ic_arrow_left_black")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 21, alignment: .leading)
        }

        Text(L10n.TakeAway.Navigation.addTakeAwayTitle)
          .accessibilityLabel(L10n.TakeAway.Navigation.addTakeAwayTitle)
          .foregroundColor(ColorCollection.black)
          .font(FontCollection.BrilliantCutProB7.medium(size: 18).font)
      }
      .padding(padding)
      .frame(width: contentWidth, height: 138, alignment: .topLeading)
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
    .frame(width: geometry.size.width, height: 138, alignment: .leading)
  }

  private func buildContentViewStack(geometry: GeometryProxy) -> some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack(spacing: 0) {
        let countRange = 0..<model.items.count
        ForEach(countRange, id: \.self) { idx in
          let item = model.items[idx]
          let showBotSeparator = idx == countRange.last.unwrapped
          TakeAwayTypeItemView(model: item,
                               geometry: geometry,
                               showBotSeparator: showBotSeparator)
        }
      }
    }
    .padding(.top, 30)
  }
}

struct TakeAwayTypeView_Previews: PreviewProvider {
  static var previews: some View {
    TakeAwayTypeView(model: .stub)
  }
}
