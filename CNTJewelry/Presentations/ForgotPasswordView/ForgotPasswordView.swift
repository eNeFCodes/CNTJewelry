//
//  ForgotPasswordView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 7/29/22.
//

import SwiftUI

struct ForgotPasswordView: View {
  @StateObject private var model: ForgotPasswordViewModel

  init(model: ForgotPasswordViewModel) {
    _model = .init(wrappedValue: model)
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
          ForgotPasswordInputView(model: model.input, geometry: geometry)
        }
        .padding(.top, optionViewFrameHeight)
        .padding(.bottom, 32)
      }

      buildNavigationViewStack()
    }
    .ignoresSafeArea()
    .background(ColorCollection.black)
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

  private func buildNavigationViewStack() -> some View {
    NavigationLink("", isActive: $model.showForgotActionSuccess) {

    }
  }
}

struct ForgotPassword_Previews: PreviewProvider {
  static var previews: some View {
    ForgotPasswordView(model: .init())
  }
}
