//
//  LoginView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct LoginView: View {
    let model: LoginViewModel

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                buildBackdropViewStack(geometry: geometry)

                VStack(spacing: 20) {
                    LoginPageHeaderView(model: model.header, geometry: geometry)
                    LoginPageWelcomeView(model: model.welcome, geometry: geometry)
                }
            }
        }
        .background(ColorCollection.black)
    }

    private func buildBackdropViewStack(geometry: GeometryProxy) -> some View {
        Group {
            let frameHeight = geometry.size.height * 0.6
            let frameWidth = geometry.size.width * 0.75

            HStack {
                Spacer()
                Image("img_bg_login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frameWidth,
                           height: frameHeight,
                           alignment: .trailing)
            }
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: .init())
            .environmentObject(AppEnvironment())
            .environmentObject(AppSettings())
    }
}
