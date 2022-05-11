//
//  FTUEShowcaseView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import SwiftUI

struct FTUEShowcaseView: View {
    let model: FTUEShowcaseViewModel

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                let titleFont = FontCollection.BrilliantCutProB7.medium(size: 22).font
                Text(model.title)
                    .accessibilityLabel(model.title)
                    .font(titleFont)
                    .foregroundColor(ColorCollection.white)
                    .multilineTextAlignment(.center)
                    .frame(minHeight: 24)

                let detailsFont = FontCollection.BrilliantCutProB7.regular(size: 16).font
                Text(model.details)
                    .accessibilityLabel(model.details)
                    .font(detailsFont)
                    .foregroundColor(ColorCollection.white)
                    .multilineTextAlignment(.center)
                    .frame(minHeight: 22)
            }

            Spacer(minLength: 20)

            ZStack {
                GeometryReader { geometry in
                    buildContentImageBorderViewStack(frameSize: geometry.size)

                    HStack(alignment: .bottom) {
                        let squareSize = geometry.size.width * 0.7
                        Image(model.contentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: squareSize, alignment: .center)
                            .padding(.bottom, 40)
                    }
                    .frame(width: geometry.size.width, alignment: .center)
                }
            }
            .frame(height: 520, alignment: .center)
        }
        .padding(32)
    }

    private func buildContentImageBorderViewStack(frameSize: CGSize) -> some View {
        VStack { Spacer() }
            .frame(width: frameSize.width, alignment: .center)
            .overlay {
                let cornerSize: CGFloat = 15
                let offsetY: CGFloat = 60

                let p1 = CGPoint(x: cornerSize, y: offsetY)
                let p2 = CGPoint(x: frameSize.width - cornerSize, y: offsetY)
                let p3 = CGPoint(x: frameSize.width, y: offsetY + cornerSize)
                let p4 = CGPoint(x: frameSize.width, y: frameSize.height - cornerSize)
                let p5 = CGPoint(x: frameSize.width - cornerSize, y: frameSize.height)
                let p6 = CGPoint(x: cornerSize, y: frameSize.height)
                let p7 = CGPoint(x: 0, y: frameSize.height - cornerSize)
                let p8 = CGPoint(x: 0, y: offsetY + cornerSize)

                BorderView(coordinates: [p1, p2, p3, p4, p5, p6, p7, p8], shouldClosePath: true)
                    .stroke(Color.orange, lineWidth: 1)
            }
    }
}

struct FTUEShowcaseView_Previews: PreviewProvider {
    static var previews: some View {
        FTUEShowcaseView(model: .init(id: 0,
                                      title: "EASILY ACCESS YOUR\nDAILY BRIEFING",
                                      details: "Your Brief is curated with the things you need to know today.",
                                      contentImage: "img_ftue2"))
        .background(ColorCollection.black)
    }
}
