//
//  ArticlePageViewModel+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/16/22.
//

import Foundation

extension ArticlePageViewModel {
  class func mockDate() -> ArticlePageViewModel {
    .init(takeAway: ArticleTakeAwayViewModel.mockImageData(),
          quote: .init(quotes: QuoteViewModel.mockItems()),
          articleText: .init(fullText: "The Mainson’s registers from 1924 make the first mention of a ring consisting of three inseparably interlaced bands, each made of a different metal: platinum, pink gold and yellow. A bracelet with han identical concept was also created the same year. The clean-lined design appealed to Elsie de Wolfe, famouse American interior designer, who would be the first to purchase one.\n\nNews combinations of colors were introduced over the years. While the most emblematic joined yellow, pinka nd white gold, Cartier also dared to introduce audacious hues, such as green gold."),
          productDetails: ProductDetailsViewModel.mockData2(),
          articleText2: .init(title: "A favorite amongst artists".uppercased(),
                              details: "Cartier Stockholm was first international jeweler to open its doors in the city—and represents our first step into the Scandinavian market. Here’s everything you need to know about the boutique and its importance to the Maison."))
  }
}
