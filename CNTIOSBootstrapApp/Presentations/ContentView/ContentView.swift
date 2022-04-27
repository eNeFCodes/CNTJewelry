//
//  ContentView.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appDelegate: AppDelegate

    @StateObject var model: ContentViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20 ) {
                let helloFont = FontCollection.BrilliantCutProB7.bold(size: 35).font
                Text(model.welcome)
                    .accessibilityLabel(model.welcome)
                    .font(helloFont)
                    .foregroundColor(ColorCollection.green)

                let dateFont = FontCollection.FancyCutCondProB7.regularItalic(size: 15).font
                Text("Date is: \(appDelegate.date.description)")
                    .font(dateFont)
                    .foregroundColor(ColorCollection.orange)
            }
            .background(ColorCollection.background)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: .init())
    }
}
