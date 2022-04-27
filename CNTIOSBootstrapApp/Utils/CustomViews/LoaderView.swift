//
//  LoaderView.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/27/22.
//

import SwiftUI

struct LoaderView<Content: View>: View {

    @Binding var isLoading: Bool
    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            content()
                .disabled(isLoading)
                .blur(radius: isLoading ? 3 : 0)

            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: ColorCollection.accentColor))
            }
            .frame(width: 150, height: 150, alignment: .center)
            .background(ColorCollection.loader.opacity(0.7))
            .opacity(isLoading ? 1 : 0)
            .cornerRadius(20)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    @State static var isLoading: Bool = true
    static var previews: some View {
        LoaderView(isLoading: $isLoading) {
            VStack {
                Text("Hello, Loader!")
            }
        }
    }
}
