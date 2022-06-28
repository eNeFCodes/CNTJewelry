//
//  AddTakeAwayView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/27/22.
//

import SwiftUI

struct AddTakeAwayView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var model: AddTakeAwayViewModel
  private let padding: CGFloat = 32

  init(model: AddTakeAwayViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        buildTopNavigationViewStack(geometry: geometry)
        buildContentViewStack(geometry: geometry)
      }
      .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
      .background(ColorCollection.black)
    }
    .ignoresSafeArea()
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
    .frame(width: geometry.size.width, height: 138, alignment: .leading)
  }

  private func buildContentViewStack(geometry: GeometryProxy) -> some View {
    VStack(spacing: 0) {
      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      let titleStr = L10n.TakeAway.Content.requiredTitle("TITLE")
      InputFieldView(inputText: $model.title,
                     model: .init(title: titleStr,
                                  titleColor: ColorCollection.white,
                                  titleFont: titleFont,
                                  placeholder: titleStr,
                                  placeholderTextColor: ColorCollection.white,
                                  placeholderFont: titleFont,
                                  textColor: ColorCollection.green,
                                  separatorColor: ColorCollection.white,
                                  activeIcon: Image("ic_close")))

      buildTextBoxViewStack(geometry: geometry)
    }
    .padding(.top, 48)
    .padding(.horizontal, padding)
    .frame(width: geometry.size.width, alignment: .top)
  }

  @ViewBuilder
  private func buildTextBoxViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(spacing: 8) {
      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      let textTitleStr = L10n.TakeAway.Content.requiredTitle("TEXT")
      Text(textTitleStr)
        .accessibilityLabel(textTitleStr)
        .foregroundColor(ColorCollection.white)
        .font(titleFont)

      ZStack(alignment: .bottomTrailing) {
        TextView(text: $model.text,
                 model: .init(font: FontCollection.BrilliantCutProB7.regular(size: 12).uiFont,
                              textColor: UIColor(ColorCollection.white),
                              textLimit: model.maxTextCount,
                              isEditable: true))
          .accessibilityLabel(model.text)
          .foregroundColor(ColorCollection.white)
          .padding(8)
          .frame(width: contentWidth, height: 214, alignment: .topLeading)

        let textCountFont = FontCollection.BrilliantCutProB7.light(size: 10).font
        Text(model.remainingTextCount.description)
          .accessibilityLabel(model.remainingTextCount.description)
          .font(textCountFont)
          .foregroundColor(ColorCollection.white)
          .padding(16)
      }
      .frame(width: contentWidth, height: 214, alignment: .bottomTrailing)
      .border(ColorCollection.white, width: 1)
    }
    .padding(.top, 40)
    .frame(width: contentWidth, alignment: .topLeading)
  }

  @ViewBuilder
  private func buildAddImageButtonViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(spacing: 16) {
      Button {

      } label: {
        Image("ic_thumbnail")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24, height: 24, alignment: .center)
      }
    }
    .frame(width: contentWidth, alignment: .center)
  }
}

struct AddTakeAwayView_Previews: PreviewProvider {
  static var previews: some View {
    AddTakeAwayView(model: .init())
  }
}
