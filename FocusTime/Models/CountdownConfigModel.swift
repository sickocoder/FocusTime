//
//  CountdownModel.swift
//  FocusTime
//
//  Created by José Tony on 11/11/23.
//

import Foundation

class CountdownConfigModel: ObservableObject {
  @Published var selectedSectionDuration: Int = 0
  @Published var numberOfSections: Int = 4
  
  @Published var remainingTime: Int? = nil
  @Published var currentSection: Int = 1
}

extension CountdownConfigModel {
  var countDownText: String {
    guard let saveValue = self.remainingTime else { return "00:00" }
    
    let remainingTime: Double = Double(saveValue)
    let min = Int(remainingTime / 60)
    let seconds = Int(remainingTime.truncatingRemainder(dividingBy: 60))
    return "\(min.leftPad(with: "0")):\(seconds.leftPad(with: "0"))"
  }
}
