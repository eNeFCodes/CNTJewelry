//
//  ForgotPasswordSuccessView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/29/22.
//

import SwiftUI

struct ForgotPasswordSuccessView: View {
  @EnvironmentObject private var appRouting: AppRouting
  @StateObject private var model: ForgotPasswordSuccessViewModel
  private let padding: CGFloat

  init(model: ForgotPasswordSuccessViewModel,
       padding: CGFloat = 32) {
    _model = .init(wrappedValue: model)
    self.padding = padding
  }

  var body: some View {
    ZStack {
      GeometryReader { geometry in
        let welcomeViewFrameHeight: CGFloat = abs(geometry.size.height - 330)
        let backdropViewFrameHeight = welcomeViewFrameHeight - 40

        buildBackdropViewStack(frameSize: .init(width: geometry.size.width * 0.75, height: backdropViewFrameHeight))

        VStack {
          LoginPageHeaderView(model: model.header, geometry: geometry)
          LoginPageWelcomeView(model: model.welcome, geometry: geometry)
        }

        let optionViewFrameHeight = welcomeViewFrameHeight + 40
        VStack {
          Spacer(minLength: 0)
          buildActionViewStack(geometry: geometry)
        }
        .padding(.horizontal, padding)
        .padding(.top, optionViewFrameHeight)
        .padding(.bottom, padding)
      }
    }
    .ignoresSafeArea()
    .background(ColorCollection.black)
  }

  @ViewBuilder
  private func buildActionViewStack(geometry: GeometryProxy) -> some View {
    // button
    let buttonSize = CGSize(width: abs(geometry.size.width - (padding * 2)), height: 56)
    Button {
      appRouting.loginMode = .default
    } label: {
      Text(L10n.Login.Password.forgotSuccessBtn)
        .accessibilityLabel(L10n.Login.Password.forgotSuccessBtn)
        .font(FontCollection.BrilliantCutProB7.bold(size: 12).font)
        .frame(width: buttonSize.width, height: buttonSize.height, alignment: .center)
    }
    .foregroundColor(ColorCollection.white)
    .background(ColorCollection.red)
    .clipped()
  }

  private func buildBackdropViewStack(frameSize: CGSize) -> some View {
    HStack {
      Spacer()
      Image("img_bg_login")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: frameSize.width, height: frameSize.height, alignment: .trailing)
        .clipped()
    }
  }
}

struct ForgotPasswordSuccessView_Previews: PreviewProvider {
    static var previews: some View {
      ForgotPasswordSuccessView(model: .init())
    }
}
