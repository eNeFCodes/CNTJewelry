//
//  LoginPageAtlasView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import SwiftUI

struct LoginPageAtlasView: View {
  @EnvironmentObject private var appEnv: AppEnvironment
  @EnvironmentObject private var appRouting: AppRouting
  @Environment(\.presentationMode) private var presentationMode

  @StateObject private var model: LoginPageAtlasViewModel

  init(model: LoginPageAtlasViewModel) {
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
          Spacer()
        }

        VStack {
          Spacer()
          LoginPageWelcomeView(model: model.welcome, geometry: geometry)
        }
        .frame(width: geometry.size.width, height: welcomeViewFrameHeight, alignment: .bottom)

        let optionViewFrameHeight = welcomeViewFrameHeight + 40
        VStack {
          LoginPageInputView(model: model.input, geometry: geometry)
        }
        .padding(.top, optionViewFrameHeight)
        .padding(.bottom, 32)
      }

      buildNavigationViewStack()
    }
    .ignoresSafeArea()
    .background(ColorCollection.black)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: Button(action: {
      presentationMode.wrappedValue.dismiss()
    }, label: {
      Image("ic_back")
    }))
    .overlayWindow(isActive: $appEnv.isLoading, windowContent: {
      LoaderView()
    })
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
    NavigationLink("", isActive: $appRouting.isUserLoggedIn) {
      FTUEView(model: .init(items: FTUEViewModel.mockItems()))
    }
  }
}

struct LoginPageAtlasView_Previews: PreviewProvider {
  static var previews: some View {
    LoginPageAtlasView(model: .init())
      .environmentObject(AppEnvironment())
      .environmentObject(AppSettings())
      .environmentObject(AppRouting())
  }
}
