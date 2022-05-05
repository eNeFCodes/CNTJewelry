//
//  ContentView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appEnv: AppEnvironment

    let model: ContentViewModel

    var body: some View {
        LoaderView(isLoading: $appEnv.isLoading) {
            NavigationView {
                WelcomeView(model: model.welcome)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: .init())
    }
}
