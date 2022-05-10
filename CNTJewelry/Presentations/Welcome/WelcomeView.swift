//
//  WelcomeView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/5/22.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject private var appDelegate: AppDelegate
    @StateObject var model: WelcomeViewModel
    
    var body: some View {
        VStack(spacing: 20 ) {
            let helloFont = FontCollection.BrilliantCutProB7.bold(size: 35).font
            Text(model.welcome)
                .accessibilityLabel(model.welcome)
                .font(helloFont)
                .foregroundColor(ColorCollection.green)

            let appNameFont = FontCollection.BrilliantCutProB7.black(size: 55).font
            Text(ConfigEnvironment.appName)
                .accessibilityLabel(ConfigEnvironment.appName)
                .font(appNameFont)
                .foregroundColor(ColorCollection.orange)

            let bundleIDFont = FontCollection.FancyCutExtProB7.thin(size: 10).font
            Text(ConfigEnvironment.appBundleID)
                .accessibilityLabel(ConfigEnvironment.appBundleID)
                .font(bundleIDFont)
                .foregroundColor(ColorCollection.black)

            let dateFont = FontCollection.FancyCutCondProB7.regularItalic(size: 15).font
            Text("Date is: \(appDelegate.date.description)")
                .font(dateFont)
                .foregroundColor(ColorCollection.orange)
        }
        .background(ColorCollection.background)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(model: .init())
            .environmentObject(AppEnvironment())
            .environmentObject(AppSettings())
    }
}
