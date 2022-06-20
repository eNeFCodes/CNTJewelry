//
//  ResourcePageTitleView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import SwiftUI

struct ResourcePageTitleView: View {
  private let model: ResourcePageTitleViewModel
  private let geometry: GeometryProxy
  private let curve: CGFloat
  private let polygonCurve: CGFloat

  init(model: ResourcePageTitleViewModel,
       geometry: GeometryProxy,
       curve: CGFloat = 110,
       polygonCurve: CGFloat = 80) {

    self.model = model
    self.geometry = geometry
    self.curve = curve
    self.polygonCurve = polygonCurve
  }

  var body: some View {
    ZStack(alignment: .top) {
      let frameWidth = geometry.size.width
      VStack { }
        .frame(width: frameWidth, height: curve * 2, alignment: .top)
        .background(ColorCollection.darkBeige.opacity(0.3))
        .mask {
          let p1 = CGPoint(x: 0, y: 0)
          let p2 = CGPoint(x: frameWidth, y: 0)
          let p3 = CGPoint(x: frameWidth, y: curve)
          let p4 = CGPoint(x: frameWidth / 2, y: curve * 2)
          let p5 = CGPoint(x: 0, y: curve)
          ShapeView(withCoordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
        }

      VStack {
        let polygonPadding: CGFloat = 20
        let polygonSidePadding: CGFloat = 50
        let polygonFrameWidth: CGFloat = abs(geometry.size.width - (polygonSidePadding * 2))
        VStack(spacing: 8) {
          let textContentFieldPadding: CGFloat = 28
          let textContentFieldWidth: CGFloat = abs(polygonFrameWidth - (textContentFieldPadding * 2))
          let subTitleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
          let titleFont = FontCollection.BrilliantCutProB7.medium(size: 28).font

          Text(model.subTitle)
            .accessibilityLabel(model.subTitle)
            .font(subTitleFont)
            .frame(width: textContentFieldWidth, alignment: .center)

          Text(model.title)
            .accessibilityLabel(model.title)
            .font(titleFont)
            .frame(width: textContentFieldWidth, alignment: .center)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(ColorCollection.black)
        .padding(.vertical, polygonCurve + polygonPadding)
        .padding(.horizontal, polygonSidePadding)
        .frame(width: polygonFrameWidth, alignment: .center)
        .background(ColorCollection.lightBeige)
        .blendMode(.multiply)
        .mask {
          GeometryReader { geometry in
            let frameWidth = geometry.size.width
            let frameHeight = geometry.size.height

            let p1 = CGPoint(x: frameWidth / 2, y: 0)
            let p2 = CGPoint(x: frameWidth, y: polygonCurve)
            let p3 = CGPoint(x: frameWidth, y: frameHeight - polygonCurve)
            let p4 = CGPoint(x: frameWidth / 2, y: frameHeight)
            let p5 = CGPoint(x: 0, y: frameHeight - polygonCurve)
            let p6 = CGPoint(x: 0, y: polygonCurve)
            ShapeView(withCoordinates: [p1, p2, p3, p4, p5, p6], shouldClosePath: true)
          }
        }
      }
      .padding(.top, 126)
      .frame(width: frameWidth, alignment: .top)

      buildBottonContentViewStack(frameWidth: frameWidth)
        .padding(.top, calculateBottonContentViewStackTopPadding(frameWidth: frameWidth))
    }
  }

  private func calculateBottonContentViewStackTopPadding(frameWidth: CGFloat) -> CGFloat {
    let polygonPadding: CGFloat = 20
    let polygonSidePadding: CGFloat = 50
    let polygonFrameWidth: CGFloat = frameWidth - (polygonSidePadding * 2)

    let textContentFieldPadding: CGFloat = 28
    let textContentFieldWidth: CGFloat = polygonFrameWidth - (textContentFieldPadding * 2)

    let subTitleFont = FontCollection.BrilliantCutProB7.bold(size: 11).uiFont
    let subTitleHeight = model.subTitle.constrainedSize(inCanvas: .init(width: textContentFieldWidth, height: .infinity),
                                                        minHeight: 13,
                                                        font: subTitleFont)

    let titleFont = FontCollection.BrilliantCutProB7.medium(size: 28).uiFont
    let titleHeight = model.title.constrainedSize(inCanvas: .init(width: textContentFieldWidth, height: .infinity),
                                                  minHeight: 30,
                                                  font: titleFont)

    let textContentViewTopPadding: CGFloat = 126
    let textContentTopBotPadding: CGFloat = (polygonCurve + polygonPadding) * 2
    let textContentHeight: CGFloat = subTitleHeight + 8 + titleHeight
    let textContentInnerLineTopPadding: CGFloat = 80

    return textContentViewTopPadding + textContentTopBotPadding + textContentHeight - textContentInnerLineTopPadding
  }

  private func buildBottonContentViewStack(frameWidth: CGFloat) -> some View {
    VStack(spacing: 24) {
      VStack(spacing: 0) {
        VStack {
          let p1 = CGPoint(x: 1, y: 0)
          let p2 = CGPoint(x: 1, y: 108)
          ShapeView(withCoordinates: [p1, p2])
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
            .foregroundColor(ColorCollection.gold)
        }
        .frame(width: 2, height: 108, alignment: .center)

        let polygonFrameWidth: CGFloat = 12
        let polygonFrameHeight: CGFloat = 12
        VStack { }
          .frame(width: polygonFrameWidth, height: polygonFrameHeight, alignment: .center)
          .background(ColorCollection.gold)
          .mask {
            let sideLength = polygonFrameHeight / 3
            let p1 = CGPoint(x: polygonFrameWidth / 2, y: 0)
            let p2 = CGPoint(x: polygonFrameWidth, y: sideLength)
            let p3 = CGPoint(x: polygonFrameWidth, y: polygonFrameHeight - sideLength)
            let p4 = CGPoint(x: polygonFrameWidth / 2, y: polygonFrameHeight)
            let p5 = CGPoint(x: 0, y: polygonFrameHeight - sideLength)
            let p6 = CGPoint(x: 0, y: sideLength)
            ShapeView(withCoordinates: [p1, p2, p3, p4, p5, p6], shouldClosePath: true)
          }
      }
      .frame(width: frameWidth, alignment: .center)

      VStack(spacing: 63) {
        let messageContentSidePadding: CGFloat = 70
        VStack {
          Text(model.message)
            .accessibilityLabel(model.message)
        }
        .padding(.leading, messageContentSidePadding)
        .padding(.trailing, messageContentSidePadding)

        VStack {
          let padding: CGFloat = 32
          let p1 = CGPoint(x: padding, y: 0)
          let p2 = CGPoint(x: frameWidth - padding, y: 0)
          ShapeView(withCoordinates: [p1, p2])
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
            .foregroundColor(ColorCollection.darkBeige)
        }
        .frame(width: frameWidth, height: 2, alignment: .center)
      }
      .multilineTextAlignment(.center)
      .foregroundColor(ColorCollection.black)
      .frame(width: frameWidth, alignment: .bottom)
    }
  }
}

struct ResourceLandingTitleView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geometry in
      ResourcePageTitleView(model: ResourcePageTitleViewModel.mockData(), geometry: geometry)
    }
  }
}
