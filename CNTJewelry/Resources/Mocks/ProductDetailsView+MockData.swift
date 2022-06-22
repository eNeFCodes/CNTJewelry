//
//  ProductDetailsView+MockData.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/15/22.
//

import Foundation

extension ProductDetailsViewModel {
  static func mockData() -> ProductDetailsViewModel {
    .init(aboutIntro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec augue tempus erat luctus consequat. In venenatis varius imperdiet. Donec non massa eu enim dapibus ullamcorper.",
          aboutTitle: "Around the Panthère BRACELET".uppercased(),
          productImage: "img_product_showcase1",
          aboutDetails: [
            .init(id: 0,
                  detail: "Miranda Kerr wearing the Juste Un Clou bracelet for the opening of an exhibition in 2012 something more.",
                  copyright: "Photograph: Menahem Kahana/Getty Images."),
            .init(id: 1,
                  detail: "Miranda Kerr wearing the Juste Un Clou bracelet for the opening of an exhibition in 2012 something more.",
                  copyright: "Photograph: Menahem Kahana/Getty Images."),
            .init(id: 2,
                  detail: "Miranda Kerr wearing the Juste Un Clou bracelet for the opening of an exhibition in 2012 something more.",
                  copyright: "Photograph: Menahem Kahana/Getty Images."),
            .init(id: 3,
                  detail: "Miranda Kerr wearing the Juste Un Clou bracelet for the opening of an exhibition in 2012 something more.",
                  copyright: "Photograph: Menahem Kahana/Getty Images."),
            .init(id: 4,
                  detail: "Miranda Kerr wearing the Juste Un Clou bracelet for the opening of an exhibition in 2012 something more.",
                  copyright: "Photograph: Menahem Kahana/Getty Images."),
            .init(id: 5,
                  detail: "Miranda Kerr wearing the Juste Un Clou bracelet for the opening of an exhibition in 2012 something more.",
                  copyright: "Photograph: Menahem Kahana/Getty Images.")
          ])
  }

  static func mockData2() -> ProductDetailsViewModel {
    .init(aboutIntro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec augue tempus erat luctus consequat. In venenatis varius imperdiet. Donec non massa eu enim dapibus ullamcorper.",
          aboutTitle: "Around the Panthère BRACELET".uppercased(),
          productImage: "img_product_showcase2",
          aboutDetails: [
            .init(id: 0,
                  title: "CELEBRITY Sightings".uppercased(),
                  detail: "The Duchess wearing the Trinity necklace for the opening of an  exhibition in 2012."),
            .init(id: 1,
                  title: "CELEBRITY Sightings".uppercased(),
                  detail: "The Duchess wearing the Trinity necklace for the opening of an  exhibition in 2012."),
            .init(id: 2,
                  title: "CELEBRITY Sightings".uppercased(),
                  detail: "The Duchess wearing the Trinity necklace for the opening of an  exhibition in 2012."),
            .init(id: 3,
                  title: "CELEBRITY Sightings".uppercased(),
                  detail: "The Duchess wearing the Trinity necklace for the opening of an  exhibition in 2012."),
            .init(id: 4,
                  title: "CELEBRITY Sightings".uppercased(),
                  detail: "The Duchess wearing the Trinity necklace for the opening of an  exhibition in 2012."),
            .init(id: 5,
                  title: "CELEBRITY Sightings".uppercased(),
                  detail: "The Duchess wearing the Trinity necklace for the opening of an  exhibition in 2012.")
          ])
  }
}
