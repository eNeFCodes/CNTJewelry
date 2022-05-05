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
            GeometryReader { proxy in
                buildBackdropViewStack(proxy: proxy)
            }
        }
        .background(ColorCollection.black)
    }

    private func buildBackdropViewStack(proxy: GeometryProxy) -> some View {
        Group {
            let frameHeight = proxy.size.height * 0.6
            let frameWidth = proxy.size.width * 0.75

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
