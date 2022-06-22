//
//  ProductCollectionView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/21/22.
//

import SwiftUI

struct ProductCollectionView: View {
  private let model: ProductCollectionViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat
  @State private var currentIndex: Int = 0

  init(model: ProductCollectionViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }

  var body: some View {
    VStack {
      buildHeaderCarouselStack(geometry: geometry)

      VStack {
        buildHeaderTitleStack(geometry: geometry)
          .padding(.top, 16)

        buildInfoDetailsStack(geometry: geometry)
          .padding(.top, 40)
      }

      buildProductCatalogStack(geometry: geometry)
        .padding(.top, 32)

      Group {
        let estimatedWidth = abs(geometry.size.width - 64)
        Image("ic_divider_red")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: estimatedWidth, height: 5, alignment: .center)
          .clipped()
      }
      .padding(.top, 40)

      Group {
        buildSellingPointStack(geometry: geometry)
      }
      .padding(.top, 40)
      .padding(.bottom, 48)
    }
    .padding(.top, 91)
    .background(ColorCollection.lightBeige)
  }

  private func buildHeaderCarouselStack(geometry: GeometryProxy) -> some View { // 295pt
    VStack(spacing: 20) { // Header
      let carouselFrameHeight: CGFloat = 235
      ZStack { // Carousel
        Group {
          VStack { // Backdrop
            Rectangle()
              .frame(width: 299, height: 181, alignment: .top)
              .foregroundColor(ColorCollection.red)
          }
          .frame(width: geometry.size.width, height: carouselFrameHeight, alignment: .topTrailing)

          VStack {
            let borderFrameSize = CGSize(width: 288, height: 174)
            HStack(alignment: .center, spacing: 4) {
              let curve: CGFloat = 10
              let p1 = CGPoint(x: curve, y: 0)
              let p2 = CGPoint(x: borderFrameSize.width - curve, y: 0)
              let p3 = CGPoint(x: borderFrameSize.width, y: curve)
              let p4 = CGPoint(x: borderFrameSize.width, y: borderFrameSize.height - curve)
              let p5 = CGPoint(x: borderFrameSize.width - curve, y: borderFrameSize.height)
              let p6 = CGPoint(x: curve, y: borderFrameSize.height)
              let p7 = CGPoint(x: 0, y: borderFrameSize.height - curve)
              let p8 = CGPoint(x: 0, y: curve)
              ShapeView(withCoordinates: [p1, p2, p3, p4, p5, p6, p7, p8],
                        shouldClosePath: true)
                .stroke(ColorCollection.gold)
                .frame(width: borderFrameSize.width, height: borderFrameSize.height, alignment: .center)
            }
            .frame(width: geometry.size.width, height: borderFrameSize.height, alignment: .bottom)
          }
          .frame(width: geometry.size.width, height: carouselFrameHeight, alignment: .bottom)
        }
        .frame(width: geometry.size.width, height: carouselFrameHeight, alignment: .center)

        buildCarouselScrollViewStack(geometry: geometry)

        HStack {
          Button {
            print("Fire")
            currentIndex = currentIndex > 0 ? currentIndex - 1 : 0
          } label: {
            Image("ic_arrow_left")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 24, height: 24, alignment: .center)
              .clipped()
          }
          .padding(10)

          Spacer()

          Button {
            print("Fire")
            let maxIdxCount = model.images.count - 1
            currentIndex = currentIndex < maxIdxCount ? currentIndex + 1 : maxIdxCount
          } label: {
            Image("ic_arrow_right")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 24, height: 24, alignment: .center)
              .clipped()
          }
          .padding(10)
        }
        .padding(8)
        .frame(width: geometry.size.width, height: carouselFrameHeight, alignment: .bottom)
      }
      .frame(width: geometry.size.width, height: carouselFrameHeight, alignment: .top)

      VStack { // Pagination
        HStack(spacing: 4) {
          let numberFont = FontCollection.FancyCutProB7.bold(size: 24).font
          let numberIdx = currentIndex + 1
          let numberIdxFormat = numberIdx > 9 ? "\(numberIdx)" : "0\(numberIdx)"

          Text(numberIdxFormat)
            .accessibilityLabel(numberIdxFormat)
            .font(numberFont)
            .foregroundColor(ColorCollection.black)

          Image("ic_line_number_separator")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 21, height: 40, alignment: .center)
            .clipped()

          Text(model.mediaCount)
            .accessibilityLabel(model.mediaCount)
            .font(numberFont)
            .foregroundColor(ColorCollection.gold)
        }
        .padding(.trailing, 40)
      }
      .frame(width: geometry.size.width, height: 40, alignment: .trailing)
    }
    .frame(width: geometry.size.width, height: 295, alignment: .center)
  }

  private func buildCarouselScrollViewStack(geometry: GeometryProxy) -> some View {
    ScrollViewReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack {
          ForEach(0..<model.images.count, id: \.self) { i in
            let media = model.images[i]
            Image(media.image)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: geometry.size.width, height: 200, alignment: .center)
              .clipped()
              .tag(i)
          }
        }
        .frame(height: 200, alignment: .center)
        .background {
          GeometryReader { geometry in
            Color.clear.preference(key: ScrollViewOffsetKey.self,
                                   value: abs(geometry.frame(in: .named("scroll")).origin.x))
          }
        }
      }
      .onChange(of: currentIndex) { newValue in
        withAnimation {
          proxy.scrollTo(newValue, anchor: .center)
        }
      }
    }
    .frame(width: geometry.size.width, height: 235, alignment: .center)
    .coordinateSpace(name: "scroll")
    .onPreferenceChange(ScrollViewOffsetKey.self) { offsetX in
      //            let newIndex = Int(offsetX / UIScreen.main.bounds.width)
      //            if newIndex != currentIndex {
      //                currentIndex = newIndex
      //            }
    }
  }

  private func buildHeaderTitleStack(geometry: GeometryProxy) -> some View {
    VStack(spacing: 8) {
      let estimatedWidth = abs(geometry.size.width - 64)
      let miniTitleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      Text(model.miniTitle)
        .accessibilityLabel(model.miniTitle)
        .foregroundColor(ColorCollection.black)
        .font(miniTitleFont)
        .frame(width: estimatedWidth, height: 15, alignment: .leading)

      let titleFont = FontCollection.BrilliantCutProB7.medium(size: 28).uiFont
      let titleHeight = model.title.constrainedSize(inCanvas: .init(width: estimatedWidth, height: .infinity), minHeight: 32, font: titleFont)
      Text(model.title)
        .accessibilityLabel(model.title)
        .foregroundColor(ColorCollection.black)
        .font(titleFont.toFont())
        .frame(width: estimatedWidth, height: titleHeight, alignment: .leading)

      VStack {
        let editionFont = FontCollection.BrilliantCutProB7.bold(size: 10).font
        Text(model.edition)
          .accessibilityLabel(model.edition)
          .foregroundColor(ColorCollection.white)
          .font(editionFont)
          .frame(alignment: .leading)
          .padding(8)
          .background(ColorCollection.red)
      }
      .frame(width: estimatedWidth, height: 28, alignment: .leading)
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }

  private func buildInfoDetailsStack(geometry: GeometryProxy) -> some View {
    VStack {
      let estimatedWidth = abs(geometry.size.width - 64)
      let detailFont = FontCollection.FancyCutProB7.light(size: 29).uiFont
      let detailHeight = model.detail.constrainedSize(inCanvas: .init(width: estimatedWidth, height: .infinity), minHeight: 32, font: detailFont)

      Text(model.detail)
        .accessibilityLabel(model.detail)
        .foregroundColor(ColorCollection.black)
        .font(detailFont.toFont())
        .frame(width: estimatedWidth, height: detailHeight, alignment: .leading)

      HStack(spacing: 24) {
        VStack {
          GeometryReader { geometry in
            let p1 = CGPoint(x: 0, y: 0)
            let p2 = CGPoint(x: 0, y: geometry.size.height)
            ShapeView(withCoordinates: [p1, p2])
              .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
              .foregroundColor(ColorCollection.black)
              .frame(width: 1, height: geometry.size.height, alignment: .leading)
          }
        }
        .frame(width: 1, alignment: .leading)

        let estimatedWidth = estimatedWidth - 25

        VStack(spacing: 24) {
          let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
          let detailFont = FontCollection.BrilliantCutProB7.medium(size: 14).font

          VStack(spacing: 8) {
            Text(L10n.Product.Collection.materials)
              .accessibilityLabel(L10n.Product.Collection.materials)
              .foregroundColor(ColorCollection.red)
              .font(titleFont)
              .frame(width: estimatedWidth, alignment: .leading)

            Text(model.materials)
              .accessibilityLabel(model.materials)
              .foregroundColor(ColorCollection.black)
              .font(detailFont)
              .frame(width: estimatedWidth, alignment: .leading)
          }

          VStack(spacing: 8) {
            Text(L10n.Product.Collection.worldWidePrice)
              .accessibilityLabel(L10n.Product.Collection.worldWidePrice)
              .foregroundColor(ColorCollection.red)
              .font(titleFont)
              .frame(width: estimatedWidth, alignment: .leading)

            Text(model.globalPrice)
              .accessibilityLabel(model.globalPrice)
              .foregroundColor(ColorCollection.black)
              .font(detailFont)
              .frame(width: estimatedWidth, alignment: .leading)
          }
          .frame(width: estimatedWidth, alignment: .leading)

          VStack(spacing: 8) {
            Text(L10n.Product.Collection.reference)
              .accessibilityLabel(L10n.Product.Collection.reference)
              .foregroundColor(ColorCollection.red)
              .font(titleFont)
              .frame(width: estimatedWidth, alignment: .leading)

            Text(model.reference)
              .accessibilityLabel(model.reference)
              .foregroundColor(ColorCollection.black)
              .font(detailFont)
              .frame(width: estimatedWidth, alignment: .leading)
          }
          .frame(width: estimatedWidth, alignment: .leading)

          VStack(spacing: 8) {
            Text(L10n.Product.Collection.launchDate)
              .accessibilityLabel(L10n.Product.Collection.launchDate)
              .foregroundColor(ColorCollection.red)
              .font(titleFont)
              .frame(width: estimatedWidth, alignment: .leading)

            Text(model.launchDate)
              .accessibilityLabel(model.launchDate)
              .foregroundColor(ColorCollection.black)
              .font(detailFont)
              .frame(width: estimatedWidth, alignment: .leading)
          }
          .frame(width: estimatedWidth, alignment: .leading)
        }
      }
      .padding(.top, 32)
    }
    .padding(.leading, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }

@ViewBuilder
  private func buildProductCatalogStack(geometry: GeometryProxy) -> some View {
    let estimatedWidth = abs(geometry.size.width - 64)
    let btnHeight: CGFloat = 54
    Button {
      print("View Product in Catalog")
    } label: {
      HStack(spacing: 8) {
        let label = L10n.Product.Collection.viewCatalog
        let labelFont = FontCollection.BrilliantCutProB7.bold(size: 12).font

        Text(label)
          .accessibilityLabel(label)
          .foregroundColor(ColorCollection.black)
          .font(labelFont)

        Image("ic_product_catalog")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 14, height: 14, alignment: .center)
      }
      .frame(width: estimatedWidth, height: btnHeight, alignment: .center)
    }
    .frame(width: estimatedWidth, height: btnHeight, alignment: .center)
    .overlay {
      let p1 = CGPoint(x: 0, y: 0)
      let p2 = CGPoint(x: estimatedWidth, y: 0)
      let p3 = CGPoint(x: estimatedWidth, y: btnHeight)
      let p4 = CGPoint(x: 0, y: btnHeight)
      ShapeView(withCoordinates: [p1, p2, p3, p4], shouldClosePath: true)
        .stroke(ColorCollection.black)
    }
  }

  private func buildSellingPointStack(geometry: GeometryProxy) -> some View {
    VStack {
      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      let estimatedWidth = abs(geometry.size.width - 64)

      Text(model.sellingPointTitle)
        .accessibilityLabel(model.sellingPointTitle)
        .font(titleFont)
        .foregroundColor(ColorCollection.black)
        .frame(width: estimatedWidth, alignment: .leading)

      VStack(spacing: 24) {
        let numberFont = FontCollection.FancyCutCondProB7.bold(size: 44).font
        let detailFont = FontCollection.FancyCutProB7.medium(size: 18).uiFont

        ForEach(model.sellingPoints, id: \.id) { sellingPoint in
          HStack(spacing: 8) {
            Text(sellingPoint.number)
              .accessibilityLabel(sellingPoint.number)
              .foregroundColor(ColorCollection.red)
              .font(numberFont)
              .frame(width: 50, alignment: .leading)

            let estimatedWidth = estimatedWidth - 58
            let detailHeight = sellingPoint.detail.constrainedSize(inCanvas: .init(width: estimatedWidth, height: .infinity),
                                                                   minHeight: 50,
                                                                   font: detailFont)
            Text(sellingPoint.detail)
              .accessibilityLabel(sellingPoint.detail)
              .foregroundColor(ColorCollection.black)
              .font(detailFont.toFont())
              .frame(width: estimatedWidth, height: detailHeight, alignment: .leading)
          }
        }
      }
      .padding(.top, 16)
      .frame(width: estimatedWidth, alignment: .leading)
    }
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .leading)
  }
}

struct ProductCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ProductCollectionView(model: ProductCollectionViewModel.mockData(),
                            geometry: geometry)
    }
  }
}
