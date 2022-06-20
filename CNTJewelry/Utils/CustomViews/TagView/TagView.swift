//
//  TagView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import SwiftUI

struct TagView: View {
  @ObservedObject private var model: TagViewModel
  private let geometry: GeometryProxy
  private let padding: CGFloat
  private let alignment: Alignment

  init(model: TagViewModel,
       geometry: GeometryProxy,
       padding: CGFloat = 32,
       alignment: Alignment = .leading) {

    self.model = model
    self.geometry = geometry
    self.padding = padding
    self.alignment = alignment
  }

  var body: some View {
    VStack(spacing: 8) {
      let estimatedWidth = abs(geometry.size.width - (padding * 2))

      if let title = model.title {
        Text(title)
          .accessibilityLabel(title)
          .foregroundColor(ColorCollection.black)
          .font(model.titleFont.toFont())
          .frame(width: estimatedWidth, alignment: .leading)
      }

      ScrollView {
        LazyVStack(spacing: 16) {
          ForEach(model.sections, id: \.section) { section in
            LazyHStack(spacing: 16) {
              ForEach(section.rows, id: \.index) { row in
                buildRowViewStack(for: row)
              }
            }
            .padding(.leading, padding)
            .padding(.trailing, padding)
            .frame(width: geometry.size.width, alignment: alignment)
          }
        }
        .padding(.leading, padding)
        .padding(.trailing, padding)
        .frame(width: geometry.size.width, alignment: alignment)
      }
    }
  }

  @ViewBuilder
  private func buildRowViewStack(for tag: TagViewRow) -> some View {
    VStack {
      let titleFont = FontCollection.font(for: FontCollection.BrilliantCutProB7.bold(size: 11))
      let foregroundColor = tag.item.isSelected ? ColorCollection.white : ColorCollection.black
      let backgroundColor = tag.item.isSelected ? ColorCollection.gold : ColorCollection.white
      Button {
        model.updateSelected(with: tag.item)
      } label: {
        Text(tag.item.name)
          .accessibilityLabel(tag.item.name)
          .font(titleFont)
          .frame(width: tag.itemCanvas.width, height: tag.itemCanvas.height, alignment: .center)
          .foregroundColor(foregroundColor)
          .background(backgroundColor)
      }
      .mask {
        GeometryReader { geometry in
          let curve: CGFloat = 6
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
    .overlay {
      GeometryReader { geometry in
        let curve: CGFloat = 6
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
}

struct TagView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      TagView(model: TagViewModel.mockData(),
              geometry: geometry,
              alignment: .leading)
    }
  }
}
