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
  @State private var isAlertActive: Bool = false

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
      .alert(isActive: $isAlertActive) {
        VStack {

        }
        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        .background(ColorCollection.black.opacity(0.7))
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
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack(spacing: 16) {
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
        buildAddImageButtonViewStack(geometry: geometry)
        buildTypeViewStack(geometry: geometry)
        buildPrimaryTopicViewStack(geometry: geometry)
        buildOtherTopicsViewStack(geometry: geometry)
        buildShowTimestampViewStack(geometry: geometry)
        buildSendCentralQueueViewStack(geometry: geometry)

        buildSubmitViewStack(geometry: geometry)
      }
      .padding(.top, 48)
      .padding(.horizontal, padding)
      .padding(.bottom, 32)
      .frame(width: geometry.size.width, alignment: .top)
    }
  }

  @ViewBuilder
  private func buildTextBoxViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 8) {
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
    .padding(.top, 24)
    .frame(width: contentWidth, alignment: .topLeading)
  }

  @ViewBuilder
  private func buildAddImageButtonViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 16) {
      Button {

      } label: {
        HStack(spacing: 8) {
          Text(L10n.Shared.Content.addImage)
            .accessibilityLabel(L10n.Shared.Content.addImage)
            .foregroundColor(ColorCollection.white)
            .font(FontCollection.BrilliantCutProB7.bold(size: 10).font)

          Image("ic_thumbnail")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24, alignment: .center)
        }
        .frame(width: 132, height: 32, alignment: .center)
        .border(ColorCollection.white, width: 1)
      }

      CheckBoxView(label: L10n.TakeAway.Content.imageCheckBoxLabel,
                   labelFont: FontCollection.BrilliantCutProB7.bold(size: 11).font,
                   labelColor: ColorCollection.white,
                   isChecked: $model.isTransparentImage)
    }
    .frame(width: contentWidth, alignment: .leading)
  }

  @ViewBuilder
  private func buildTypeViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 16) {
      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      let titleStr = L10n.TakeAway.Content.requiredTitle("TAKEAWAY TYPE")
      Text(titleStr)
        .accessibilityLabel(titleStr)
        .foregroundColor(ColorCollection.white)
        .font(titleFont)

      AddButton {
        print("action:", titleStr)
      }
    }
    .padding(.top, 24)
    .frame(width: contentWidth, alignment: .leading)
  }

  @ViewBuilder
  private func buildPrimaryTopicViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 16) {
      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      let titleStr = L10n.TakeAway.Content.requiredTitle("PRIMARY TOPIC")
      Text(titleStr)
        .accessibilityLabel(titleStr)
        .foregroundColor(ColorCollection.white)
        .font(titleFont)

      AddButton {
        print("action:", titleStr)

        model.canSubmit.toggle() // TODO: test
      }
    }
    .padding(.top, 24)
    .frame(width: contentWidth, alignment: .leading)
  }

  @ViewBuilder
  private func buildOtherTopicsViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 16) {
      let titleFont = FontCollection.BrilliantCutProB7.bold(size: 11).font
      let titleStr = L10n.TakeAway.Content.requiredTitle("OTHER TOPICS")
      Text(titleStr)
        .accessibilityLabel(titleStr)
        .foregroundColor(ColorCollection.white)
        .font(titleFont)

      AddButton {
        print("action:", titleStr)

        model.canSubmit.toggle() // TODO: test
      }
    }
    .padding(.top, 24)
    .frame(width: contentWidth, alignment: .leading)
  }

  @ViewBuilder
  private func buildShowTimestampViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 0) {
      CheckBoxView(label: L10n.TakeAway.Content.timestampLabel,
                   labelFont: FontCollection.BrilliantCutProB7.bold(size: 11).font,
                   labelColor: ColorCollection.white,
                   isChecked: $model.showTimestamp)
    }
    .padding(.top, 24)
    .frame(width: contentWidth, alignment: .leading)
  }

  @ViewBuilder
  private func buildSendCentralQueueViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .leading, spacing: 0) {
      CheckBoxView(label: L10n.TakeAway.Content.sendToCentralQueueLabel,
                   labelFont: FontCollection.BrilliantCutProB7.bold(size: 11).font,
                   labelColor: ColorCollection.white,
                   isChecked: $model.sendToCentralQueue)
    }
    .padding(.top, 8)
    .frame(width: contentWidth, alignment: .leading)
  }

  @ViewBuilder
  private func buildSubmitViewStack(geometry: GeometryProxy) -> some View {
    let contentWidth = abs(geometry.size.width - (padding * 2))
    VStack(alignment: .center, spacing: 16) {
      Rectangle()
        .stroke(ColorCollection.darkBeige, style: StrokeStyle(lineWidth: 2, lineCap: .butt, dash: [2]))
        .frame(width: abs(geometry.size.width - (padding * 2)), height: 1, alignment: .center)

      Text(model.submitTitleLabel)
        .accessibilityLabel(model.submitTitleLabel)
        .foregroundColor(ColorCollection.textInActive)
        .font(FontCollection.FancyCutProB7.regular(size: 16).font)
        .padding(.top, 32)
        .frame(minHeight: 21, alignment: .center)

      CTAButton(isEnabled: model.canSubmit, size: .init(width: contentWidth, height: CTAButton.DefaultHeight)) {
        print("SUBMIT...")
        
        isAlertActive.toggle() // TODO: test
      }
    }
    .padding(.top, 24)
    .frame(width: contentWidth, alignment: .top)
  }
}

struct AddTakeAwayView_Previews: PreviewProvider {
  static var previews: some View {
    AddTakeAwayView(model: .init())
  }
}
