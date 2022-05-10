//
//  LoginPageHeaderView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/6/22.
//

import SwiftUI

struct LoginPageHeaderView: View {
    let model: LoginPageHeaderViewModel
    let geometry: GeometryProxy

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    buildTitleViewStack(geometry: geometry)
                    Spacer()
                }

                VStack {
                    Spacer()
                    buildLogoViewStack(geometry: geometry)
                }
            }
        }
        .padding(.top, 40)
        .frame(width: geometry.size.width, height: 340, alignment: .center)
    }

    private func buildTitleViewStack(geometry: GeometryProxy) -> some View {
        HStack {
            let frameSize = CGSize(width: abs(geometry.size.width - 80), height: 160)

            buildCombinedTitleStack(isPlain: model.isPlain)
                .foregroundColor(ColorCollection.white)
                .frame(width: frameSize.width, height: frameSize.height, alignment: .leading)
                .padding(.leading, 32)
                .overlay {
                    let rect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

                    let p1 = CGPoint(x: 0, y: 0)
                    let p2 = CGPoint(x: rect.width - 20, y: 0)
                    let p3 = CGPoint(x: rect.width, y: 20)
                    let p4 = CGPoint(x: rect.width, y: rect.height - 20)
                    let p5 = CGPoint(x: rect.width - 20, y: rect.height)
                    let p6 = CGPoint(x: 0, y: rect.height)

                    BorderView(coordinates: [p1, p2, p3, p4, p5, p6])
                        .stroke(Color.yellow, lineWidth: 2)
                }
            Spacer()
        }
        .frame(width: geometry.size.width, height: 220, alignment: .bottomLeading)
    }

    @ViewBuilder
    private func buildCombinedTitleStack(isPlain: Bool) -> some View {
        let titleFont = isPlain ? FontCollection.BrilliantCutProB7.medium(size: 35).font : FontCollection.FancyCutCondProB7.regularItalic(size: 60).font
        let subTitleFont = isPlain ? FontCollection.BrilliantCutProB7.medium(size: 35).font : FontCollection.BrilliantCutProB7.medium(size: 15).font

        let combinedText =
        Text(model.title)
            .font(titleFont)
        +
        Text("\n")
        +
        Text(model.subTitle)
            .font(subTitleFont)

        combinedText
            .accessibilityLabel(model.fullString)
    }

    private func buildLogoViewStack(geometry: GeometryProxy) -> some View {
        HStack {
            Image("ic_logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
        }
        .frame(width: geometry.size.width, alignment: .bottomTrailing)
    }
}

struct LoginPageHeaderView_Previews: PreviewProvider {
    static let model: LoginPageHeaderViewModel = .init(title: L10n.App.Content.title,
                                                       subTitle: L10n.App.Content.subTitle,
                                                       isPlain: false)
    static var previews: some View {
        GeometryReader { geometry in
            LoginPageHeaderView(model: model, geometry: geometry)
                .background(ColorCollection.black)
        }
    }
}
