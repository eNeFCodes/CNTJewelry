//
//  LoginPageInputView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import SwiftUI

struct LoginPageInputView: View {
    @ObservedObject var  model: LoginPageInputViewModel
    let geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 20) {
            buildInputFieldViewStack(for: $model.email)
            buildInputFieldViewStack(for: $model.password)
        }
    }

    @ViewBuilder
    private func buildInputFieldViewStack(for field: Binding<LoginPageInputViewModel.Field>) -> some View {
        let maxFieldHeight: CGFloat = 56

        ZStack(alignment: .bottomLeading) {
            VStack { }
                .frame(width: geometry.size.width, height: 1, alignment: .center)
                .overlay {
                    let p1 = CGPoint(x: 0, y: 0)
                    let p2 = CGPoint(x: geometry.size.width, y: 0)
                    BorderView(coordinates: [p1, p2])
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(ColorCollection.white)
                }

            Text(field.placeholder.wrappedValue)
                .accessibility(hidden: true)
                .foregroundColor(ColorCollection.white)
                .frame(height: maxFieldHeight, alignment: .leading)
                .opacity(field.inpuString.wrappedValue.isEmpty ? 1 : 0)

            SecureField("", text: field.inpuString)
                .accessibilityLabel(field.placeholder.wrappedValue)
                .frame(height: maxFieldHeight, alignment: .leading)
                .foregroundColor(.white)
        }
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
