//
//  FTUEView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/11/22.
//

import SwiftUI

struct FTUEView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var model: FTUEViewModel

    init(model: FTUEViewModel) {
        _model = .init(wrappedValue: model)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                buildBackdropViewStack(frameSize: .init(width: geometry.size.width, height: 230))

                ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(model.items, id: \.id) { item in
                                buildContentItemViewStack(for: item, geometry: geometry)
                            }
                        }
                    }
                    .onChange(of: model.activeIndex) { newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }

                buildCloseButtonViewStack()

                VStack {
                    Spacer()
                    DotView(model: .init(range: 0..<model.items.count, activeIndex: $model.activeIndex, action: {

                    }), geometry: geometry)
                }
                .padding(.bottom, 30)
            }
            .frame(width: geometry.size.width, alignment: .center)
        }
        .ignoresSafeArea()
        .background(ColorCollection.black)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

    private func buildBackdropViewStack(frameSize: CGSize) -> some View {
        VStack {
            Spacer()
            Image("img_ftue_bottom_bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frameSize.width, height: frameSize.height, alignment: .top)
        }
    }

    @ViewBuilder
    private func buildContentItemViewStack(for item: FTUEViewContentItemProtocol, geometry: GeometryProxy) -> some View {
        let frameHeight = abs(geometry.size.height - 160)
        VStack {
            Spacer()
            switch item.type {
            case .showcase:
                if let item = item as? FTUEShowcaseViewModel {
                    FTUEShowcaseView(model: item)
                        .id(item.id)
                        .frame(width: geometry.size.width, height: frameHeight, alignment: .center)
                }
            default:
                if let item = item as? FTUEIntroViewModel {
                    FTUEIntroView(model: item)
                        .id(item.id)
                        .frame(width: geometry.size.width, height: frameHeight, alignment: .center)
                }
            }
            Spacer()
        }
        .padding(.bottom, 32)
    }

    private func buildCloseButtonViewStack() -> some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    print("Triggered close")
                } label: {
                    Image("ic_close_white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .padding(10)
            }
            .padding(.top, 30)
            Spacer()
        }
    }
}

struct FTUEView_Previews: PreviewProvider {
    static var previews: some View {
        FTUEView(model: .init(items: FTUEViewModel.mockItems()))
            .environmentObject(AppEnvironment())
            .environmentObject(AppSettings())
            .background(ColorCollection.black)
    }
}
