//
//  ArticleCollectionView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import SwiftUI

struct ArticleCollectionView: View {
  @ObservedObject private var model: ArticleCollectionViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat

  init(model: ArticleCollectionViewModel, geometry: GeometryProxy, padding: CGFloat = 32) {
    self.model = model
    self.geometry = geometry
    self.padding = padding
  }
  
  var body: some View {
    ZStack(alignment: .top) {
      buildTextContentStack(geometry: geometry, padding: padding)
      buildScrollableContentViewStack(geometry: geometry, padding: padding)
    }
    .frame(width: geometry.size.width, alignment: .top)
  }

  @ViewBuilder
  private func buildTextContentStack(geometry: GeometryProxy, padding: CGFloat) -> some View {
    let collectionViewWidth = abs(geometry.size.width - (padding * 2))
    VStack {
      VStack(spacing: 16) {
        let textContentWidth = collectionViewWidth - (padding * 2)
        let titleFont = FontCollection.font(for: FontCollection.FancyCutCondProB7.bold(size: 30))
        Text(model.title)
          .accessibilityLabel(model.title)
          .foregroundColor(ColorCollection.white)
          .font(titleFont)
          .frame(width: textContentWidth, height: 80, alignment: .leading)

        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: textContentWidth, y: 0)
        ShapeView(withCoordinates: [p1, p2])
          .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
          .foregroundColor(ColorCollection.gold)
          .frame(width: textContentWidth, height: 1, alignment: .leading)

        HStack {
          let detailContentWidth = abs(textContentWidth - 93)
          let detailFont = FontCollection.font(for: FontCollection.FancyCutProB7.regular(size: 16))
          Text(model.details)
            .accessibilityLabel(model.details)
            .foregroundColor(ColorCollection.white)
            .font(detailFont)
            .frame(width: detailContentWidth, alignment: .leading)
        }
        .padding(.top, 32)
        .frame(width: textContentWidth, height: 190, alignment: .topLeading)

        HStack {
          Image("ic_3arrow_gold")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 11, alignment: .leading)
        }
        .padding(.trailing, 110)
        .frame(width: textContentWidth, alignment: .trailing)
      }
      .padding(.top, 40)
      .padding(.horizontal, padding)
      .frame(width: collectionViewWidth, alignment: .leading)
    }
    .frame(width: collectionViewWidth, height: 415, alignment: .top)
    .background(ColorCollection.black)
    .mask {
      GeometryReader { geometry in
        let curve: CGFloat = 20
        let width = geometry.size.width
        let height = geometry.size.height

        let p1 = CGPoint(x: curve, y: 0)
        let p2 = CGPoint(x: width - curve, y: 0)
        let p3 = CGPoint(x: width, y: curve)
        let p4 = CGPoint(x: width, y: height - curve)
        let p5 = CGPoint(x: width - curve, y: height)
        let p6 = CGPoint(x: curve, y: height)
        let p7 = CGPoint(x: 0, y: height - curve)
        let p8 = CGPoint(x: 0, y: curve)
        ShapeView(withCoordinates: [p1, p2, p3, p4, p5, p6, p7, p8], shouldClosePath: true)
      }
    }
  }

  @ViewBuilder
  private func buildScrollableContentViewStack(geometry: GeometryProxy, padding: CGFloat) -> some View {
    let startLeadPadding = abs(geometry.size.width - 180)
    ScrollView(.horizontal, showsIndicators: false) {
      ScrollViewReader { proxy in
        LazyHStack(alignment: .top) {
          ForEach(0..<model.items.count, id: \.self) { i in
            let item = model.items[i]
            let leadPadding = i == 0 ? startLeadPadding : 0
            viewForContentType(item: item, geometry: geometry)
              .padding(.leading, leadPadding)
          }
        }
        .padding(.top, 135)
      }
    }
  }

  @ViewBuilder
  private func viewForContentType(item: WeeklyCollectionItemModelProtocol, geometry: GeometryProxy) -> some View {
    if item.type == .variant1, let model = item as? WeeklyCollectionItemViewModel {
      WeeklyCollectionItemView(model: model, geometry: geometry)
    } else if item.type == .variant2, let model = item as? WeeklyCollectionItemV2ViewModel  {
      WeeklyCollectionItemV2View(model: model, geometry: geometry)
    } else if item.type == .variant3, let model = item as? WeeklyCollectionItemV3ViewModel {
      WeeklyCollectionItemV3View(model: model, geometry: geometry)
    }
  }
}

struct ArticleCollectionView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ArticleCollectionView(model: .init(title: "DISCOVER the collection".uppercased(),
                                         details: "Here's a selection of articles about Trinity Collection.",
                                         items: ArticleCollectionViewModel.mockItems()),
                            geometry: geometry)
    }
  }
}
