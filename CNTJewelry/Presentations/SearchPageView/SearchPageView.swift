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

  @StateObject private var tfConfig1: InputFieldViewModel = {
    .init(id: 0,
          titleColor: ColorCollection.black,
          showTitle: true,
          textColor: ColorCollection.green,
          separatorColor: ColorCollection.black,
          showButton: true,
          icon: Image("ic_search_white"),
          activeIcon: Image("ic_close"))
  }()

  @StateObject private var tfConfig2: InputFieldViewModel = {
    .init(id: 0,
          titleColor: ColorCollection.white,
          textColor: ColorCollection.white,
          separatorColor: .white,
          showButton: true,
          icon: Image("ic_search_white"),
          activeIcon: Image("ic_close_white"))
  }()

  init(model: SearchPageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    let shouldSwitchColor = !model.searchedText.isEmpty && !model.searchResults.isEmpty
    let bgColorAll: Color = shouldSwitchColor ? ColorCollection.white : ColorCollection.black
    GeometryReader { geometry in
      ZStack {
        VStack {
          let hSize = CGSize(width: geometry.size.width * 0.75, height: 120)
          HStack {
            let titleFont = FontCollection.FancyCutCondProB7.bold(size: 30).font
            let titleStr = "SEARCH"
            let fgColor: Color = shouldSwitchColor ? ColorCollection.white : ColorCollection.black
            let bgColor: Color = shouldSwitchColor ? ColorCollection.black : ColorCollection.white

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
                ShapeView(withCoordinates: [p1, p2, p3, p4, p5], shouldClosePath: true)
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
        if !model.searchResults.isEmpty {
          InputFieldView(model: tfConfig1)
            .padding(20)
        } else {
          InputFieldView(model: tfConfig2)
            .padding(20)
        }
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

  private func emptyResultView(geometry: GeometryProxy) -> some View {
    VStack(spacing: 10) {
      Spacer()
      let noResultFont = FontCollection.FancyCutCondProB7.bold(size: 15).font
      Text("NO RESULTS FOUND")
        .accessibilityLabel("NO RESULTS FOUND")
        .font(noResultFont)
        .foregroundColor(ColorCollection.yellow)
        .multilineTextAlignment(.center)

      let noResultMsgFont = FontCollection.BrilliantCutProB7.regular(size: 20).font
      Text("Please try searching for\nsomething else.")
        .accessibilityLabel("Please try searching for\nsomething else.")
        .font(noResultMsgFont)
        .foregroundColor(ColorCollection.white)
        .multilineTextAlignment(.center)

      Spacer()
    }
    .frame(width: abs(geometry.size.width), alignment: .center)
  }

  private func resultsView(geometry: GeometryProxy) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      let searchedTitleFont = FontCollection.FancyCutCondProB7.bold(size: 20).font
      let searchedTitle = !model.searchResults.isEmpty ? "\(model.searchResults.count) RESULTS" : "POPULAR SEARCHES"
      Text(searchedTitle)
        .accessibilityLabel(searchedTitle)
        .font(searchedTitleFont)
        .foregroundColor(ColorCollection.yellow)
        .padding(20)

      ScrollView(.vertical) {
        LazyVStack {
          if !model.searchResults.isEmpty {
            ForEach(model.searchResults) { result in
              let model = WeeklyCollectionItemViewModel(title: result.title,
                                                        subTitle: result.subTitle,
                                                        imageName: result.imageName,
                                                        date: result.date)
              WeeklyCollectionItemView(model: model, geometry: geometry)
                .padding(.vertical, 20)
            }
          } else {
            ForEach(model.popularSearches) { searched in

            }
            .foregroundColor(ColorCollection.white)
          }
        }
      }
    }
    .frame(width: abs(geometry.size.width), alignment: .leading)
  }
}

struct SearchPageView_Previews: PreviewProvider {
  static var previews: some View {
    SearchPageView(model: .init())
  }
}
