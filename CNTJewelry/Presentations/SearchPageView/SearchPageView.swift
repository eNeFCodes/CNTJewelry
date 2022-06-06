//
//  SearchPageView.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import SwiftUI
import Combine

struct SearchPageView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject private var model: SearchPageViewModel

  init(model: SearchPageViewModel) {
    _model = .init(wrappedValue: model)
  }

  var body: some View {
    let shouldSwitchColor = !model.searchedText.isEmpty && !model.searchResults.isEmpty
    let bgColorAll: Color = shouldSwitchColor ? ColorCollection.white : ColorCollection.black
    GeometryReader { geometry in
      buildSearchPageHeaderViewStack(geometry: geometry, shouldSwitchColor: shouldSwitchColor)

      VStack {
        inputFieldConfig(forEmptyResult: model.searchResults.isEmpty)
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

  @ViewBuilder
  private func inputFieldConfig(forEmptyResult emptyResult: Bool) -> some View {
    if !emptyResult {
      InputFieldView(inputText: $model.searchedText,
                     model: .init(titleColor: ColorCollection.black,
                                  textColor: ColorCollection.green,
                                  separatorColor: ColorCollection.black,
                                  showButton: true,
                                  icon: Image("ic_search_white"),
                                  activeIcon: Image("ic_close")))
    } else {
      InputFieldView(inputText: $model.searchedText,
                     model: .init(titleColor: ColorCollection.white,
                                  textColor: ColorCollection.white,
                                  separatorColor: .white,
                                  showButton: true,
                                  icon: Image("ic_search_white"),
                                  activeIcon: Image("ic_close_white")))
    }
  }

  private func buildSearchPageHeaderViewStack(geometry: GeometryProxy, shouldSwitchColor: Bool) -> some View {
    ZStack {
      VStack {
        let hSize = CGSize(width: geometry.size.width * 0.75, height: 120)
        HStack {
          let titleFont = FontCollection.FancyCutCondProB7.bold(size: 30).font
          let titleStr = L10n.SearchPage.Content.title
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
  }

  private func emptyResultView(geometry: GeometryProxy) -> some View {
    VStack(spacing: 10) {
      Spacer()
      let noResultFont = FontCollection.FancyCutCondProB7.bold(size: 15).font
      Text(L10n.SearchPage.Result.notFound)
        .accessibilityLabel(L10n.SearchPage.Result.notFound)
        .font(noResultFont)
        .foregroundColor(ColorCollection.yellow)
        .multilineTextAlignment(.center)

      let noResultMsgFont = FontCollection.BrilliantCutProB7.regular(size: 20).font
      Text(L10n.SearchPage.Result.noResultMessage)
        .accessibilityLabel(L10n.SearchPage.Result.noResultMessage)
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
      let searchedTitle = !model.searchResults.isEmpty ? L10n.SearchPage.Result.resultCount(model.searchResults.count) : L10n.SearchPage.Result.popularSearches
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
            ForEach(model.popularSearches) { item in
              createTappableField(for: item, geometry: geometry)
            }
            .foregroundColor(ColorCollection.white)
          }
        }
      }
    }
    .frame(width: abs(geometry.size.width), alignment: .leading)
  }

  private func createTappableField(for item: SearchPageViewModel.Searched, geometry: GeometryProxy) -> some View {
    Button {
      searchedItemTapped(item: item)
    } label: {
      Text(item.title)
        .accessibilityLabel(item.title)
        .tag(item.id)
        .frame(width: abs(geometry.size.width), height: 40, alignment: .leading)
    }
    .padding(.horizontal, 20)
    .frame(width: abs(geometry.size.width), height: 40, alignment: .leading)
  }

  private func searchedItemTapped(item: SearchPageViewModel.Searched) {
    print("searchedItemTapped: \(item.id) -- \(item.title)")
  }
}

struct SearchPageView_Previews: PreviewProvider {
  static var previews: some View {
    SearchPageView(model: .init())
  }
}
