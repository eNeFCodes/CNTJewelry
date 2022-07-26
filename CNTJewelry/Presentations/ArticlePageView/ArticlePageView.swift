//
//  ArticlePageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/7/22.
//

import SwiftUI

struct ArticlePageView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var model: ArticlePageViewModel
  private let padding: CGFloat = 32

  init(model: ArticlePageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      VStack {
        buildTopNavigationViewStack(geometry: geometry)
        ScrollViewReader { proxy in
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 48) {
              ArticleTakeAwayView(model: model.takeAway,
                                  geometry: geometry)
              createArticleTextViewStack(geometry: geometry)
              QuoteView(model: model.quote,
                        geometry: geometry)
              ArticleTextView(model: model.articleText2,
                              geometry: geometry)
              ProductDetailsView(model: model.productDetails,
                                 geometry: geometry)
              ArticleTextView(model: model.articleText3,
                              geometry: geometry)

              buildContentViews(geometry: geometry)
            }
          }
        }
      }
    }
    .ignoresSafeArea()
    .navigationBarHidden(true)
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

        Text(L10n.TakeAway.Navigation.addTakeAwayTitle)
          .accessibilityLabel(L10n.TakeAway.Navigation.addTakeAwayTitle)
          .foregroundColor(ColorCollection.black)
          .font(FontCollection.BrilliantCutProB7.medium(size: 18).font)
      }
      .padding(padding)
      .padding(.top, 10)
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
    .frame(width: geometry.size.width, alignment: .leading)
  }

  @ViewBuilder
  private func buildContentViews(geometry: GeometryProxy) -> some View {
    ProductItemView(model: model.productItem,
                    geometry: geometry,
                    padding: padding)
    ArticleTextView(model: model.articleText4,
                    geometry: geometry)
    PlayCardView(model: model.playCard,
                 geometry: geometry)
    ArticleTextView(model: model.articleText5,
                    geometry: geometry)
    CollectionShowcaseView(model: model.collectionShowcase,
                           geometry: geometry)
    ArticleCollectionView(model: model.articleCollection,
                          geometry: geometry)
  }

  private func createArticleTextViewStack(geometry: GeometryProxy) -> some View {
    VStack {
      let initialFont = FontCollection.FancyCutProB7.regular(size: 140).font
      let bodyFont = FontCollection.FancyCutProB7.regular(size: 18).uiFont

      let contentWidth = abs(geometry.size.width - (padding * 2))
      let toleranceHeight: CGFloat = geometry.size.width == 390 ? 60 : 80
      let fullTextFrameHeight = model.articleText.bodyText.constrainedSize(inCanvas: .init(width: contentWidth, height: .infinity), font: bodyFont) + toleranceHeight

      let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 93, height: 100))
      TextView(text: model.articleText.bodyText,
               model: .init(font: bodyFont,
                            exclusionPaths: [path]))
      .padding(.horizontal, padding)
      .frame(maxWidth: geometry.size.width, minHeight: fullTextFrameHeight, maxHeight: .infinity, alignment: .center)
      .overlay {
        GeometryReader { geometry in
          HStack {
            Text(model.articleText.initialText)
              .font(initialFont)
              .foregroundColor(ColorCollection.black)
              .frame(width: 93, height: 120, alignment: .center)
          }
          .padding(.horizontal, padding)
          .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
      }
    }
  }
}

struct ArticlePageView_Previews: PreviewProvider {
  static var previews: some View {
    ArticlePageView(model: ArticlePageViewModel.mockDate())
  }
}
