//
//  TakeAwayTypeView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/22/22.
//

import Combine
import SwiftUI

struct TakeAwayTypeView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var model: TakeAwayTypeViewModel
  private let padding: CGFloat = 32
  private let action: (_ items: [TakeAwayTypeItemViewModel]) -> Void
  private let activeSelections: [TakeAwayTypeItemViewModel]

  init(model: TakeAwayTypeViewModel,
       activeSelections: [TakeAwayTypeItemViewModel] = [],
       action: @escaping (_ items: [TakeAwayTypeItemViewModel]) -> Void) {
    _model = .init(wrappedValue: model)
    self.activeSelections = activeSelections
    self.action = action
  }

  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        buildTopNavigationViewStack(geometry: geometry)
        buildContentViewStack(geometry: geometry)
        buildDoneButtonViewStack(geometry: geometry)
      }
      .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
      .background(ColorCollection.black)
    }
    .ignoresSafeArea()
    .navigationBarHidden(true)
    .onAppear {
      model.updateActiveSelection(with: activeSelections)
    }
  }

  private func buildTopNavigationViewStack(geometry: GeometryProxy) -> some View {
    HStack {
      let contentWidth = abs(geometry.size.width - 96)
      VStack(alignment: .leading, spacing: 22) {
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image("ic_arrow_left_black")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 21, alignment: .leading)
        }

        Text(model.title)
          .accessibilityLabel(model.title)
          .foregroundColor(ColorCollection.black)
          .font(FontCollection.BrilliantCutProB7.medium(size: 18).font)
      }
      .padding(padding)
      .padding(.top, 10)
      .frame(minWidth: contentWidth, maxWidth: contentWidth, minHeight: 138, alignment: .topLeading)
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
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack(spacing: 0) {
        let countRange = 0..<model.items.count
        ForEach(countRange, id: \.self) { idx in
          let item = model.items[idx]
          let showBotSeparator = idx == countRange.last.unwrapped
          TakeAwayTypeItemView(model: item,
                               geometry: geometry,
                               showBotSeparator: showBotSeparator) { item in
            model.toggleItemSelected(item)
          }
        }
      }
    }
    .padding(.top, 30)
  }

  private func buildDoneButtonViewStack(geometry: GeometryProxy) -> some View {
    Button {
      let selectedTypes = model.items.filter { $0.isSelected }
      if !selectedTypes.isEmpty {
        action(selectedTypes)
        presentationMode.wrappedValue.dismiss()
      }
    } label: {
      VStack {
        Text(L10n.Shared.Content.done)
          .accessibilityLabel(L10n.Shared.Content.done)
          .foregroundColor(ColorCollection.white)
          .font(FontCollection.BrilliantCutProB7.bold(size: 12).font)
      }
      .padding(.horizontal, padding)
      .frame(width: geometry.size.width, height: 56, alignment: .center)
      .background(ColorCollection.red)
    }
  }
}

struct TakeAwayTypeView_Previews: PreviewProvider {
  static let publisher = PassthroughSubject<[TakeAwayTypeItemViewModel], Never>()
  static var previews: some View {
    TakeAwayTypeView(model: .stubTakeAway) { _ in }
  }
}
