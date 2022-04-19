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
//            let helloFont = Font(name: FontCollections.FancyCutProB7.bold.name, size: 15)!
            Text("Hello, World!")
//                .font(helloFont.toFont())
//
//            let dateFont = Font(name: FontCollections.FancyCutCondProB7.regular.name, size: 12)!
            Text("Date is: \(appDelegate.date.description)")
//                .font(dateFont.toFont())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
