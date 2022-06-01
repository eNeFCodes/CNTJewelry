//
//  BriefingViewModel.swift
//  CNTJewelry
//
//  Created by Neil Francis Hipona on 5/31/22.
//

import Foundation

class BriefingViewModel: ObservableObject {
  let bonjurDate: String
  let bonjurTitle: String

  init(bonjurDate: String, bonjurTitle: String) {
    self.bonjurDate = bonjurDate
    self.bonjurTitle = bonjurTitle
  }
}
