//
//  SearchPageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import SwiftUI

struct SearchPageView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var model: SearchPageViewModel

  init(model: SearchPageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    let shouldSwitchColor = !model.searchedText.isEmpty && !model.searchResults.isEmpty
    let bgColorAll: Color = shouldSwitchColor ? .white : .black
    GeometryReader { geometry in
        ZStack {
            VStack {
                let hSize = CGSize(width: geometry.size.width * 0.75, height: 120)
                HStack {
                    let titleFont = Font.custom("FancyCutCondProB7-Bold", size: 30)
                    let titleStr = "SEARCH"
                    let fgColor: Color = shouldSwitchColor ? .white : .black
                    let bgColor: Color = shouldSwitchColor ? .black : .white

                    Text(titleStr)
                        .accessibilityLabel(titleStr)
                        .font(titleFont)
                        .foregroundColor(fgColor)
                        .padding(20)
                        .padding(.top, 20)
                        .frame(width: abs(hSize.width), height: hSize.height, alignment: .leading)
                        .background(bgColor)
                        .mask {
                            let curve: CGFloat = 20
                            let p1 = CGPoint(x: 0, y: 0)
                            let p2 = CGPoint(x: hSize.width, y: 0)
                            let p3 = CGPoint(x: hSize.width, y: hSize.height - curve)
                            let p4 = CGPoint(x: hSize.width - curve, y: hSize.height)
                            let p5 = CGPoint(x: 0, y: hSize.height)
                            BorderView(coordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
                        }
                }
                .frame(height: hSize.height, alignment: .leading)
                Spacer()
            }
            .ignoresSafeArea()
            .frame(width: abs(geometry.size.width), alignment: .leading)

            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        let closeIcon = shouldSwitchColor ? Image("ic_close") : Image("ic_close_white")
                        closeIcon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                            .padding(20)
                    }
                }
                .padding(.top, 20)
                Spacer()
            }
        }
        .frame(width: abs(geometry.size.width), alignment: .center)

        VStack {
            InputFieldView(text: $model.searchedText, config: makeSearchFieldConfig(), showTitle: !model.searchedText.isEmpty)
                .padding(20)

            ZStack {
                if !model.searchedText.isEmpty && model.searchResults.isEmpty {
                    emptyResultView(geometry: geometry)
                } else {
                    resultsView(geometry: geometry)
                }
            }
        }
        .padding(.top, 150)
    }
    .background(bgColorAll)
    .ignoresSafeArea()
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
}
}

struct SearchPageView_Previews: PreviewProvider {
  static var previews: some View {
    SearchPageView(model: .init())
  }
}
