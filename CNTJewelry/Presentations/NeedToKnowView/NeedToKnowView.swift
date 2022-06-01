//
//  NeedToKnowView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/1/22.
//

import SwiftUI

struct NeedToKnowView: View {
  @StateObject private var model: NeedToKnowViewModel
  private let padding: CGFloat

  init(model: NeedToKnowViewModel, padding: CGFloat = 32) {
    _model = .init(wrappedValue: model)
    self.padding = padding
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        buildTitleViewStack(geometry: geometry)
        buildKnowInfoViewStack(geometry: geometry)
          .padding(.top, 86)
      }
      .frame(width: geometry.size.width, alignment: .center)
    }
    .frame(height: 498)
  }

  private func buildTitleViewStack(geometry: GeometryProxy) -> some View {
    VStack {
      let redBGViewWidth = abs(geometry.size.width - 85)
      VStack {
        let titleFont = FontCollection.font(for: FontCollection.FancyCutCondProB7.bold(size: 30))
        Text(model.title)
          .accessibilityLabel(model.title)
          .font(titleFont)
          .foregroundColor(ColorCollection.white)
          .padding(.top, padding)
        Spacer()
      }
      .padding(.horizontal, padding)
      .frame(width: redBGViewWidth, height: 412, alignment: .leading)
      .background(ColorCollection.red)
      .mask {
        GeometryReader { geometry in
          let curve: CGFloat = 20
          let width = geometry.size.width
          let height = geometry.size.height

          let p1 = CGPoint(x: 0, y: 0)
          let p2 = CGPoint(x: width - curve, y: 0)
          let p3 = CGPoint(x: width, y: curve)
          let p4 = CGPoint(x: width, y: height)
          let p5 = CGPoint(x: 0, y: height)
          ShapeView(withCoordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
        }
      }
      Spacer()
    }
    .frame(width: geometry.size.width, alignment: .leading)
  }

  private func buildKnowInfoViewStack(geometry: GeometryProxy, maxHeight: CGFloat = 399) -> some View {
    VStack {
      Spacer()
      let itemWidth = abs(geometry.size.width - (padding * 2))
      ScrollViewReader { proxy in
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: 12) {
            let maxKnowTosIndexCount = model.knowTos.count - 1
            ForEach(0...maxKnowTosIndexCount, id: \.self) { i in
              let item = model.knowTos[i]
              NeedToKnowInfoView(model: item)
                .padding(.leading, i == 0 ? padding : 0)
                .padding(.trailing, i == maxKnowTosIndexCount ? padding : 0)
                .frame(width: itemWidth, height: maxHeight, alignment: .center)
            }
          }
          .frame(height: maxHeight, alignment: .center)
        }
        .onChange(of: model.currentIndex) { newValue in
          withAnimation {
            proxy.scrollTo(newValue, anchor: .center)
          }
        }
      }
    }
  }
}

struct NeedToKnowView_Previews: PreviewProvider {
  static var previews: some View {
    NeedToKnowView(model: .init(title: "YOUR BOUTIQUE",
                                knowTos: NeedToKnowViewModel.knowTos()))
  }
}
