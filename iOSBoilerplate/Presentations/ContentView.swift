//
//  ContentView.swift
//  iOSBoilerplate
//
//  Created by Neil Francis Hipona on 4/18/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var appDelegate: AppDelegate

    var body: some View {
        VStack(spacing: 20 ) {
            Text("Hello, World!")
            Text("Date is: \(appDelegate.date.description)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
