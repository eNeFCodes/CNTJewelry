//
//  ResourceNavigationViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 6/20/22.
//

import Foundation
import SwiftUI

struct ResourceNavigationViewModel {
  let title: String
  let subTitle: String
  let logo: String?

  init(title: String,
       subTitle: String,
       logo: String? = nil) {
    
    self.title = title
    self.subTitle = subTitle
    self.logo = logo
  }
}

extension ResourceNavigationViewModel {
  func triggerSearchAction() {
    
  }
  
  func triggerProfileAction() {
    
  }
}
