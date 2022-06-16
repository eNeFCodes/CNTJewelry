//
//  ProductItemV2View.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/2/22.
//

import SwiftUI

struct ProductItemV2View: View {
  @ObservedObject private var model: ProductItemV2ViewModel

  private let geometry: GeometryProxy
  private let padding: CGFloat
  private let borderPadding: CGFloat

  init(model: ProductItemV2ViewModel,
       geometry: GeometryProxy,
       borderPadding: CGFloat = 32,
       padding: CGFloat = 24) {

    self.model = model
    self.geometry = geometry
    self.borderPadding = borderPadding
    self.padding = padding
  }

  var body: some View {
    VStack {
      let borderedWidth = abs(geometry.size.width - (borderPadding * 2))
      let paddedWidth = abs(borderedWidth - (padding * 2))

      VStack {
        buildImageViewStack(borderedWidth: borderedWidth)
          .padding(.top, 8)

        buildTextContentViewStack(paddedWidth: paddedWidth)
          .padding(.top, 8)
      }
      .frame(width: borderedWidth, alignment: .center)
      .overlay {
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
                  .stroke(ColorCollection.gold)
          }
      }
    }
    .frame(width: geometry.size.width, alignment: .center)
  }

  private func buildImageViewStack(borderedWidth: CGFloat) -> some View {
    ZStack {
      let imageSize = CGSize(width: borderedWidth - padding, height: 230)

      VStack { } // background
        .frame(width: imageSize.width, height: 173, alignment: .center)
      .background(ColorCollection.black)

      Image(model.imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: imageSize.width, height: imageSize.height, alignment: .center)
    }
    .frame(width: borderedWidth, alignment: .trailing)
  }

  private func buildTextContentViewStack(paddedWidth: CGFloat) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      let titleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 10))
      Text(model.title)
        .accessibilityLabel(model.title)
        .font(titleFont)
        .frame(minHeight: 12, alignment: .leading)

      HStack(alignment: .top, spacing: 10) {
        VStack(alignment: .leading) {
          let subTitleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 22))
          Text(model.subTitle)
            .accessibilityLabel(model.subTitle)
            .font(subTitleFont)
            .frame(minHeight: 24, alignment: .leading)
        }
        Spacer()
        VStack(alignment: .trailing) {
          Button {
            model.triggerFavorite()
          } label: {
            let iconName = model.isFavorite ? "ic_bookmark_selected" : "ic_bookmark"
            Image(iconName)
              .resizable()
              .frame(width: 24, height: 24, alignment: .center)
          }
        }
      }
      .frame(width: paddedWidth, alignment: .top)

      let detailsFont = FontCollection.font(for: FontCollection.FancyCutProB7.regular(size: 22)).weight(.light)
      Text(model.details)
        .accessibilityLabel(model.details)
        .font(detailsFont)
        .padding(.top, 8)

      buildAuthorDetailsViewStack(paddedWidth: paddedWidth)
        .padding(.top, 8)

      if model.showSeparator {
        VStack {
          let p1 = CGPoint(x: 0, y: 0)
          let p2 = CGPoint(x: paddedWidth, y: 0)
          ShapeView(withCoordinates: [p1, p2])
            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [2]))
            .foregroundColor(ColorCollection.goldSeparator)
        }
        .frame(width: paddedWidth, height: 1, alignment: .center)
        .padding(.top, 22)
      }
    }
    .padding(.horizontal, padding)
    .frame(width: paddedWidth, alignment: .center)
  }

  private func buildAuthorDetailsViewStack(paddedWidth: CGFloat) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      let boldFont = FontCollection.font(for: FontCollection.FancyCutProB7.bold(size: 12))
      let regularFont = FontCollection.font(for: FontCollection.FancyCutProB7.regular(size: 12))

      Text(model.time)
        .accessibilityLabel(model.time)
        .frame(width: paddedWidth, alignment: .leading)
        .font(boldFont)

      Group {
        let authName = "\(model.author),"
        let authDetails = " \(model.authorDetails)"
        Text(authName)
          .accessibilityLabel(authName)
          .font(boldFont)
        +
        Text(authDetails)
          .accessibilityLabel(authDetails)
          .font(regularFont)
      }

      Text(model.location)
        .accessibilityLabel(model.location)
        .font(boldFont)
        .frame(width: paddedWidth, alignment: .leading)
    }
  }
}

struct WeeklyCollectionItemV2View_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ProductItemV2View(model: .init(imageName: "img_ring",
                                              title: "TAKEAWAY",
                                              subTitle: "Congratulate\nMaria".uppercased(),
                                              details: "Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before. Its five-year mission: to explore strange new worlds again.",
                                              time: "5 mins ago".uppercased(),
                                              author: "Jane Doe",
                                              authorDetails: "Lorem Ispum Role",
                                              location: "5th Avenue Mansion"), geometry: geometry)
    }
  }
}
