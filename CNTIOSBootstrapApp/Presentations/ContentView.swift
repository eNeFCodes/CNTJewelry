//
//  ContentView.swift
//  CNTIOSBootstrapApp
//
//  Created by Neil Francis Hipona on 4/18/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var appDelegate: AppDelegate

    var body: some View {
        VStack(spacing: 20 ) {
            let helloFont = FontCollection.BrilliantCutProB7.bold(size: 25).font
            Text("Hello, World!")
                .font(helloFont)

            let dateFont = FontCollection.FancyCutCondProB7.regularItalic(size: 15).font
            Text("Date is: \(appDelegate.date.description)")
                .font(dateFont)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
