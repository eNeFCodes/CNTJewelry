//
//  LoginPageInputView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import SwiftUI

struct LoginPageInputView: View {
    @EnvironmentObject private var appEnv: AppEnvironment
    @ObservedObject private var  model: LoginPageInputViewModel
    
    private let geometry: GeometryProxy
    private let padding: CGFloat

    init(model: LoginPageInputViewModel,
         geometry: GeometryProxy,
         padding: CGFloat = 32) {
        self.model = model
        self.geometry = geometry
        self.padding = padding
    }

    var body: some View {
        VStack(spacing: 20) {
            buildInputFieldViewStack(for: $model.email, placeholderString: L10n.Login.InputField.emailPlaceholder)
            buildInputFieldViewStack(for: $model.password, placeholderString: L10n.Login.InputField.passwordPlaceholder, isSecured: true)

            Spacer()

            // button
            let buttonSize = CGSize(width: abs(geometry.size.width - (padding * 2)), height: 56)
            Button {
                Task {
                    appEnv.isLoading = true
                    appEnv.isUserLoggedIn = await model.triggerLogin()
                    appEnv.isLoading = false
                }
            } label: {
                Text(model.actionTitle)
                    .accessibilityLabel(model.actionTitle)
                    .frame(width: buttonSize.width, height: buttonSize.height, alignment: .center)
            }
            .border(.gray, width: 1)
            .foregroundColor(model.canProceed ? ColorCollection.white : ColorCollection.grayInactive)
            .disabled(!model.canProceed)
        }
    }

    @ViewBuilder
    private func buildInputFieldViewStack(for inputString: Binding<String>, placeholderString: String, isSecured: Bool = false) -> some View {
        let maxFieldWidth = abs(geometry.size.width - (padding * 2))
        let maxFieldHeight: CGFloat = 56

        ZStack(alignment: .bottomLeading) {
            VStack { }
                .frame(width: maxFieldWidth, height: 1, alignment: .center)
                .overlay {
                    let p1 = CGPoint(x: 0, y: 0)
                    let p2 = CGPoint(x: maxFieldWidth, y: 0)
                    BorderView(coordinates: [p1, p2])
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(ColorCollection.white)
                }

            Text(placeholderString)
                .accessibility(hidden: true)
                .foregroundColor(ColorCollection.white)
                .frame(width: maxFieldWidth, height: maxFieldHeight, alignment: .leading)
                .opacity(inputString.wrappedValue.isEmpty ? 1 : 0)

            if isSecured {
                SecureField("", text: inputString)
                    .accessibilityLabel(inputString.wrappedValue)
                    .frame(width: maxFieldWidth, height: maxFieldHeight, alignment: .leading)
                    .foregroundColor(ColorCollection.white)
            } else {
                TextField("", text: inputString)
                    .accessibilityLabel(inputString.wrappedValue)
                    .frame(width: maxFieldWidth, height: maxFieldHeight, alignment: .leading)
                    .foregroundColor(ColorCollection.white)
            }
        }
        .padding([.leading, .trailing], padding)
        .frame(height: maxFieldHeight, alignment: .leading)
    }
}

struct LoginPageInputView_Previews: PreviewProvider {
    static let model: LoginPageInputViewModel = .init()
    static var previews: some View {
        GeometryReader { geometry in
            LoginPageInputView(model: model, geometry: geometry)
                .background(ColorCollection.black)
        }
    }
}
