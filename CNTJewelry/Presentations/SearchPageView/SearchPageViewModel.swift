//
//  SearchPageViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/3/22.
//

import SwiftUI
import Combine

extension SearchPageViewModel {
  struct Searched: Identifiable, Hashable {
    let id: Int
    let title: String
    let subTitle: String
    let imageName: String
    let date: String

    init(id: Int,
         title: String,
         subTitle: String = "",
         imageName: String = "",
         date: String = "") {

      self.id = id
      self.title = title
      self.subTitle = subTitle
      self.imageName = imageName
      self.date = date
    }
  }
}

class SearchPageViewModel: ObservableObject {
  @Published var popularSearches: [Searched]
  @Published var searchResults: [Searched]
  @Published var searchedText: String
  @Published var selectedItem: Searched?

  var toSearchItems: [SearchPageViewModel.Searched] = SearchMockData.toSearchItems

  private var subscriptions = Set<AnyCancellable>()
  private var textChange = PassthroughSubject<String, Never>()

  init(popularSearches: [Searched] = SearchMockData.popularSearches,
       searchResults: [Searched] = [],
       searchedText: String = "",
       selectedItem: Searched? = nil) {
    self.popularSearches = popularSearches
    self.searchResults = searchResults
    self.searchedText = searchedText
    self.selectedItem = selectedItem

    setBindings()
  }

  private func setBindings() {
    $searchedText
      .sink(receiveValue: { [weak self] text in
        guard let self = self else { return }
        if text.isEmpty {
          self.searchResults = []
          self.textChange.send("")
        } else {
          self.textChange.send(text)
        }
      })
      .store(in: &subscriptions)
    
    textChange
      .debounce(for: .seconds(1), scheduler: DispatchQueue.global(qos: .background))
      .map { [weak self] text -> AnyPublisher<[SearchPageViewModel.Searched], Never> in
        guard let self = self else { return PassthroughSubject<[SearchPageViewModel.Searched], Never>().eraseToAnyPublisher() }
        return self.performFilter(for: text)
      }
      .switchToLatest()
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] results in
        guard let self = self else { return }
        self.searchResults = results
      })
      .store(in: &subscriptions)
  }
}

extension SearchPageViewModel {
  private func performFilter(for query: String) -> AnyPublisher<[SearchPageViewModel.Searched], Never> {
    if query.isEmpty {
      return CurrentValueSubject([]).eraseToAnyPublisher()
    } else {
      let results = toSearchItems.filter({ item in
        item.title.lowercased().hasPrefix(query.lowercased())
      })
      return CurrentValueSubject(results).eraseToAnyPublisher()
    }
  }
}
