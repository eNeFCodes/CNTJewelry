//
//  LoginView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appEnv: AppEnvironment
    @EnvironmentObject private var appRouting: AppRouting
    @StateObject private var model: LoginViewModel

    init(model: LoginViewModel) {
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

                let optionViewFrameHeight = welcomeViewFrameHeight + 56
                VStack {
                    LoginPageOptionView(model: model.option, geometry: geometry)
                }
                .padding(.top, optionViewFrameHeight)
            }
            .onReceive(model.option.publisher) { type in
                switch type {
                case .atlasLogin:
                    print("atlasLogin")
                    appRouting.loginMode = .atlas
                case .faceAndTouchID:
                    print("faceAndTouchID")
                    appRouting.loginMode = .biometrics
                    model.triggerBiometrics { state in
                        appRouting.isUserLoggedIn = state
                    }
                }
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

    @ViewBuilder
    private func buildNavigationViewStack() -> some View {
        NavigationLink("", isActive: $appRouting.isLoginModeAtlas) {
            LoginPageAtlasView(model: .init())
        }

        NavigationLink("", isActive: $appRouting.isUserLoggedIn) {
            FTUEView(model: .init(items: FTUEViewModel.mockItems()))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: .init())
            .environmentObject(AppEnvironment())
            .environmentObject(AppSettings())
            .environmentObject(AppRouting())
    }
}
