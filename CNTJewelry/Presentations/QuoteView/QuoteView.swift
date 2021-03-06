//
//  QuoteView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import SwiftUI

struct QuoteView: View {
  private var model: QuoteViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: QuoteViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    ZStack(alignment: .top) {
      let contentWidth = abs(geometry.size.width - padding)
      buildContentViewStack(contentWidth: contentWidth)
        .padding(.top, 50)

      Image("img_quote_stroke")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.leading, 72)
        .frame(width: contentWidth, height: 89, alignment: .leading)
    }
    .padding(.leading, padding)
    .frame(width: geometry.size.width, alignment: .trailing)
  }

  private func buildContentViewStack(contentWidth: CGFloat) -> some View {
    VStack { // main view - black bg
      let coloredViewBGWidth = contentWidth - 40
      VStack(spacing: 8) { // secondary view - content view
        let maxIndex = model.quotes.count - 1
        let itemRange = Range(0...maxIndex)
        buildScrollableQuotesViewStack(contentWidth: coloredViewBGWidth, itemRange: itemRange)

        if maxIndex > 0 {
          DotOnlyView(model: .init(range: itemRange,
                                   activeIndex: model.$currentIndex,
                                   dotColor: ColorCollection.black,
                                   dotStrokeColor: ColorCollection.black,
                                   dotInactiveStrokeColor: ColorCollection.black),
                      contentWidth: coloredViewBGWidth)
        }
      }
      .padding(.top, 72)
      .padding(.bottom, 45)
      .frame(width: coloredViewBGWidth, alignment: .top)
      .background(ColorCollection.beige)
    }
    .frame(width: contentWidth, alignment: .trailing)
    .background(ColorCollection.black)
    .mask {
      GeometryReader { geometry in
        let curve: CGFloat = 20
        let p1 = CGPoint(x: curve, y: 0)
        let p2 = CGPoint(x: geometry.size.width, y: 0)
        let p3 = CGPoint(x: geometry.size.width, y: geometry.size.height)
        let p4 = CGPoint(x: 0, y: geometry.size.height)
        let p5 = CGPoint(x: 0, y: curve)
        ShapeView(withCoordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
      }
    }
  }

  private func buildScrollableQuotesViewStack(contentWidth: CGFloat, itemRange: Range<Int>) -> some View {
    ScrollViewReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(alignment: .top) {
          ForEach(itemRange, id: \.self) { i in
            let item = model.quotes[i]
            buildQuoteTextViewStack(contentWidth: contentWidth, item: item)
              .tag(i)
          }
        }
      }
      .onChange(of: model.currentIndex) { newValue in
        withAnimation {
          proxy.scrollTo(newValue, anchor: .center)
        }
      }
    }
  }

  @ViewBuilder
  private func buildQuoteTextViewStack(contentWidth: CGFloat, item: Quote, padding: CGFloat = 32) -> some View {
    let detailFont = FontCollection.FancyCutProB7.light(size: 29).font
    let copyrightAuthorFont = FontCollection.FancyCutProB7.bold(size: 16).font
    let copyrightDetailsFont = FontCollection.FancyCutProB7.regular(size: 16).font

    VStack(spacing: 8) {
      Text(item.detail)
        .accessibilityLabel(item.detail)
        .font(detailFont)
        .foregroundColor(ColorCollection.black)
        .padding(.horizontal, padding)
        .frame(width: contentWidth, alignment: .leading)

      HStack {
        Text(item.copyrightAuthor)
          .accessibilityLabel(item.copyrightAuthor)
          .font(copyrightAuthorFont)
          .foregroundColor(ColorCollection.black)
        +
        Text(", ")
          .accessibilityLabel(item.copyrightDetails)
          .font(copyrightDetailsFont)
          .foregroundColor(ColorCollection.black)
        +
        Text(item.copyrightDetails)
          .accessibilityLabel(item.copyrightDetails)
          .font(copyrightDetailsFont)
          .foregroundColor(ColorCollection.black)
      }
      .padding(.horizontal, padding)
      .frame(width: contentWidth, alignment: .leading)
    }
    .frame(width: contentWidth, alignment: .leading)
  }
}

struct QuoteView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      QuoteView(model: .init(quotes: QuoteViewModel.mockItem()),
                geometry: geometry)
    }
  }
}
