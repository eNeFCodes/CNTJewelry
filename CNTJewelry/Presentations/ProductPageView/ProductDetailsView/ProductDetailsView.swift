//
//  ProductDetailsView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/15/22.
//

import SwiftUI

struct ProductDetailsView: View {
  private let model: ProductDetailsViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat
  @State private var aboutDetailsCurrentIndex: Int = 0

  init(model: ProductDetailsViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack {
      //buildAboutIntroStack(geometry: geometry)
      buildAboutProductStack(geometry: geometry)
    }
  }

  private func buildAboutIntroStack(geometry: GeometryProxy) -> some View {
    VStack {
      let estimatedWidth = abs(geometry.size.width - (padding * 2))
      let aboutIntroFont = FontCollection.font(for: FontCollection.FancyCutProB7.regular(size: 18))
      Text(model.aboutIntro)
        .accessibilityLabel(model.aboutIntro)
        .foregroundColor(ColorCollection.black)
        .font(aboutIntroFont)
        .frame(width: estimatedWidth, alignment: .leading)

      let aboutTitleFont = FontCollection.font(for: FontCollection.FancyCutCondProB7.bold(size: 30))
      Text(model.aboutTitle)
        .accessibilityLabel(model.aboutTitle)
        .foregroundColor(ColorCollection.black)
        .font(aboutTitleFont)
        .frame(width: estimatedWidth, alignment: .leading)
        .padding(.top, 48)
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }

  private func buildAboutProductStack(geometry: GeometryProxy) -> some View  {
    ZStack {
      VStack {
        Image(model.productImage)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: geometry.size.width, height: 481, alignment: .top)
          .clipped()
        Spacer()
      }

      VStack(alignment: .trailing) {
        Spacer()
        let productDetailsViewWidth = abs(geometry.size.width - 44)
        VStack(spacing: 0) {
          HStack(spacing: 4) { // Pagination
            let numberFont = FontCollection.font(for: FontCollection.FancyCutProB7.bold(size: 24))
            let numberIdx = aboutDetailsCurrentIndex + 1
            let numberIdxFormat = numberIdx > 9 ? "\(numberIdx)" : "0\(numberIdx)"

            Text(numberIdxFormat)
              .accessibilityLabel(numberIdxFormat)
              .font(numberFont)
              .foregroundColor(ColorCollection.white)

            Image("ic_line_number_separator")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 21, height: 40, alignment: .center)
              .clipped()

            Text(model.aboutDetailsCount)
              .accessibilityLabel(model.aboutDetailsCount)
              .font(numberFont)
              .foregroundColor(ColorCollection.gold)
          }
          .padding(.leading, 24)
          .frame(width: productDetailsViewWidth, height: 67, alignment: .leading)

          let detailsStackViewHeight: CGFloat = 166
          VStack {
            let sidePadding: CGFloat = 24
            let productDetailsMaskedViewWidth = productDetailsViewWidth - padding
            VStack(spacing: 0) { // Details
              let contentWidth = productDetailsMaskedViewWidth - (sidePadding * 2)
              buildAboutProductScrollViewStack(maxWidth: productDetailsMaskedViewWidth)

              let maxIndex = model.aboutDetails.count - 1
              DotOnlyView(model: .init(range: Range(0...maxIndex),
                                       activeIndex: $aboutDetailsCurrentIndex,
                                       dotColor: ColorCollection.white,
                                       dotStrokeColor: ColorCollection.white,
                                       dotInactiveStrokeColor: ColorCollection.whiteInactiveDotColor),
                          contentWidth: contentWidth,
                          alignment: .leading)
            }
            .frame(width: productDetailsMaskedViewWidth, height: detailsStackViewHeight, alignment: .leading)
            .background(ColorCollection.red)
            .mask {
              let curve: CGFloat = 20
              let p1 = CGPoint(x: 0, y: 0)
              let p2 = CGPoint(x: productDetailsMaskedViewWidth - curve, y: 0)
              let p3 = CGPoint(x: productDetailsMaskedViewWidth, y: curve)
              let p4 = CGPoint(x: productDetailsMaskedViewWidth, y: detailsStackViewHeight)
              let p5 = CGPoint(x: 0, y: detailsStackViewHeight)
              ShapeView(withCoordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
            }
          }
          .frame(width: productDetailsViewWidth, height: detailsStackViewHeight, alignment: .leading)
        }
        .frame(width: productDetailsViewWidth, height: 233, alignment: .leading)
        .background(ColorCollection.black)
      }
      .frame(width: geometry.size.width, alignment: .trailing)
    }
    .frame(width: geometry.size.width, height: 647, alignment: .trailing)
  }

  private func buildAboutProductScrollViewStack(maxWidth: CGFloat, definedHeight: CGFloat = 110) -> some View {
    ScrollViewReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack {
          ForEach(0..<model.aboutDetails.count, id: \.self) { i in
            let item = model.aboutDetails[i]
            drawAboutProductDetailStack(maxWidth: maxWidth,
                                        definedHeight: definedHeight,
                                        item: item)
          }
        }
        .onChange(of: aboutDetailsCurrentIndex) { newValue in
          withAnimation {
            proxy.scrollTo(newValue, anchor: .center)
          }
        }
      }
      .frame(width: maxWidth, height: definedHeight, alignment: .center)
    }
  }

  @ViewBuilder
  private func drawAboutProductDetailStack(maxWidth: CGFloat, definedHeight: CGFloat, item: ProductDetailsViewModel.Details) -> some View {
    let sidePadding: CGFloat = 24
    VStack(spacing: 8) {
      let contentWidth: CGFloat = maxWidth - sidePadding * 2

      if !item.title.isEmpty {
        let titleFont = FontCollection.BrilliantCutProB7.bold(size: 16).font
        Text(item.title)
          .accessibilityLabel(item.title)
          .font(titleFont)
          .foregroundColor(ColorCollection.white)
          .frame(width: contentWidth, alignment: .leading)
      }

      let detailFont = FontCollection.font(for: FontCollection.FancyCutProB7.regular(size: 16))
      Text(item.detail)
        .accessibilityLabel(item.detail)
        .font(detailFont)
        .foregroundColor(ColorCollection.white)
        .frame(width: contentWidth, alignment: .leading)

      if !item.copyright.isEmpty {
        Spacer(minLength: 0)

        let copyrightFont = FontCollection.font(for: FontCollection.FancyCutProB7.light(size: 12))
        Text(item.copyright)
          .accessibilityLabel(item.copyright)
          .foregroundColor(ColorCollection.white)
          .font(copyrightFont)
          .frame(width: contentWidth, height: 14, alignment: .topLeading)
      }
    }
    .padding(.top, 24)
    .padding(.horizontal, sidePadding)
    .frame(width: maxWidth, height: definedHeight, alignment: .center)
  }
}

struct ProductDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ProductDetailsView(model: ProductDetailsViewModel.mockData2(),
                         geometry: geometry)
    }
  }
}
