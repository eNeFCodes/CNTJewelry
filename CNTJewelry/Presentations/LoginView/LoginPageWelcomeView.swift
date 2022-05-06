//
//  LoginPageWelcomeView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import SwiftUI

struct LoginPageWelcomeView: View {
    let model: LoginPageWelcomeViewModel
    let geometry: GeometryProxy

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            let titleFont = FontCollection.BrilliantCutProB7.medium(size: 22).font
            Text(model.title)
                .accessibilityLabel(model.title)
                .font(titleFont)

            let messageFont = FontCollection.FancyCutProB7.regular(size: 16).font
            Text(model.message)
                .accessibilityLabel(model.message)
                .font(messageFont)
        }
        .foregroundColor(ColorCollection.white)
        .padding([.leading, .trailing], 32)
        .frame(width: geometry.size.width, alignment: .leading)
    }
}

struct LoginPageWelcomeView_Previews: PreviewProvider {
    static let model: LoginPageWelcomeViewModel = .init(title: L10n.App.Welcome.atlasTitle,
                                                        message: L10n.App.Welcome.atlasMessage)
    static var previews: some View {
        GeometryReader { geometry in
            LoginPageWelcomeView(model: model, geometry: geometry)
                .background(ColorCollection.black)
        }
    }
}
