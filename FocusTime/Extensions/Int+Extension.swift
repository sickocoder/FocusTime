//
//  Int+Extension.swift
//  FocusTime
//
//  Created by José Tony on 15/09/23.
//

import Foundation

extension Int {
  func leftPad(with: String) -> String {
    if self > 9 {
      return "\(self)"
    }
    
    return "\(with)\(self)"
  }
}
