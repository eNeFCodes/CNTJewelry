//
//  LoginPageOptionView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import SwiftUI

struct LoginPageOptionView: View {
    @ObservedObject private var model: LoginPageOptionViewModel
    private let geometry: GeometryProxy

    init(model: LoginPageOptionViewModel, geometry: GeometryProxy) {
        self.model = model
        self.geometry = geometry
    }

    var body: some View {
        VStack(spacing: 24) {
            ForEach(model.actions, id: \.id) { action in
                buildOptionButtonViewStack(for: action)
            }
        }
        .frame(width: geometry.size.width, alignment: .center)
    }

    @ViewBuilder
    private func buildOptionButtonViewStack(for action: LoginPageOptionViewModel.Action) -> some View {
        let frameSize = CGSize(width: abs(geometry.size.width - 64), height: 56)

        Button {
            model.triggerAction(with: action.type)
        } label: {
            let titleFont = FontCollection.BrilliantCutProB7.bold(size: 12).font
            Text(action.title)
                .accessibilityLabel(action.title)
                .font(titleFont)
                .frame(width: frameSize.width, height: frameSize.height)
        }
        .background(ColorCollection.red)
    }
}

struct LoginPageOptionView_Previews: PreviewProvider {
    static let model: LoginPageOptionViewModel = .init(actions: [
        .init(id: 0, title: L10n.Login.Option.atlas, type: .atlasLogin),
        .init(id: 1, title: L10n.Login.Option.biometrics, type: .faceAndTouchID)
    ])
    static var previews: some View {
        GeometryReader { geometry in
            LoginPageOptionView(model: model, geometry: geometry)
        }
    }
}
