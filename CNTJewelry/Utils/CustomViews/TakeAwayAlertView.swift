//
//  TakeAwayAlertView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/30/22.
//

import SwiftUI

extension TakeAwayAlertView {
  enum Action {
    case close
    case cancel
    case `continue`
  }
}

struct TakeAwayAlertView: View {
  private let title: String
  private let message: String
  private let padding: CGFloat

  private let action: (_ action: Action) -> Void

  init(title: String,
       message: String,
       padding: CGFloat = 28,
       action: @escaping (_ action: Action) -> Void) {

    self.title = title
    self.message = message
    self.padding = padding
    self.action = action
  }

  var body: some View {
    GeometryReader { geometry in
      ColorCollection.black
        .opacity(0.7)

      VStack {
        Spacer(minLength: 0)

        let contentWidth = abs(geometry.size.width - (padding * 2))
        VStack(spacing: 16) {
          buildCloseButtonViewStack(geometry: geometry)
          buildTitleContentViewStack()
            .padding(.bottom, 16)
          buildActionButtonViewStack(geometry: geometry)
        }
        .padding(.top, 16)
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
        .multilineTextAlignment(.center)
        .frame(width: contentWidth, alignment: .center)
        .background(ColorCollection.white)

        Spacer(minLength: 0)
      }
      .frame(width: geometry.size.width, alignment: .center)
    }
    .ignoresSafeArea()
  }

  @ViewBuilder
  private func buildCloseButtonViewStack(geometry: GeometryProxy) -> some View {
    let padding = (padding * 2) + 32
    let contentWidth = abs(geometry.size.width - padding)
    HStack {
      Spacer(minLength: 0)
      Button {
        action(.close)
      } label: {
        Image("ic_close")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 32, height: 32, alignment: .center)
      }
    }
    .frame(width: contentWidth, height: 32, alignment: .trailing)
  }

  private func buildTitleContentViewStack() -> some View {
    VStack(spacing: 6) {
      Text(title)
        .accessibilityLabel(title)
        .foregroundColor(ColorCollection.red)
        .font(FontCollection.BrilliantCutProB7.bold(size: 11).font)

      Text(message)
        .accessibilityLabel(message)
        .foregroundColor(ColorCollection.black)
        .font(FontCollection.FancyCutProB7.light(size: 26).font)
    }
  }

  private func buildActionButtonViewStack(geometry: GeometryProxy) -> some View {
    VStack(spacing: 16) {
      let padding = (padding * 2) + 64
      let contentWidth = abs(geometry.size.width - padding)
      let textFont = FontCollection.BrilliantCutProB7.bold(size: 12).font
      Button {
        action(.cancel)
      } label: {
        HStack {
          Text(L10n.Shared.Content.cancel)
            .accessibilityLabel(L10n.Shared.Content.cancel)
            .foregroundColor(ColorCollection.white)
            .font(textFont)
        }
        .frame(width: contentWidth, height: 46, alignment: .center)
        .background(ColorCollection.red)
      }

      Button {
        action(.continue)
      } label: {
        HStack {
          Text(L10n.Shared.Content.continue)
            .accessibilityLabel(L10n.Shared.Content.continue)
            .foregroundColor(ColorCollection.red)
            .font(textFont)
        }
        .frame(width: contentWidth, height: 46, alignment: .center)
        .background(ColorCollection.white)
        .border(ColorCollection.red, width: 1)
      }
    }
  }
}

struct TakeAwayAlertView_Previews: PreviewProvider {
  static var previews: some View {
    TakeAwayAlertView(title: "DELETE TAKEAWAY",
                      message: "When closing this window, the unpublished takeaway will be lost.") { action in

    }
  }
}
