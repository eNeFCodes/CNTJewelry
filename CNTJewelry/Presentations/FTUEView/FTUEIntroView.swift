//
//  FTUEIntroView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import SwiftUI

struct FTUEIntroView: View {
    let model: FTUEIntroViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                buildVerticalDashesViewStack()

                let squareSize = abs(geometry.size.width * 0.4)
                Image(model.introLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: squareSize, height: squareSize, alignment: .center)

                let headerStr = L10n.Ftue.Intro.welcome(model.username)
                let headerFont = FontCollection.BrilliantCutProB7.medium(size: 28).font
                Text(headerStr)
                    .accessibilityLabel(headerStr)
                    .foregroundColor(ColorCollection.white)
                    .multilineTextAlignment(.center)
                    .font(headerFont)

                let detailsFont = FontCollection.BrilliantCutProB7.light(size: 29).font
                Text(model.introMessage)
                    .accessibilityLabel(model.introMessage)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .font(detailsFont)

                Spacer()

                buildVerticalDashesViewStack()
            }
            .padding([.leading, .trailing], 32)
        }
    }

    private func buildVerticalDashesViewStack() -> some View {
        return VStack {}
        .frame(width: 2, height: 80, alignment: .center)
        .overlay {
            let start = CGPoint(x: 1, y: 0)
            let end = CGPoint(x: 1, y: 80)
            BorderView(coordinates: [start, end])
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [3]))
                .foregroundColor(ColorCollection.orange)
        }
    }
}

struct FTUEIntroView_Previews: PreviewProvider {
    static var previews: some View {
        FTUEIntroView(model: .init(id: 0,
                                   introLogo: "img_lanyards"))
            .background(ColorCollection.black)
    }
}
