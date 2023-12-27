//
//  FocusTimeApp.swift
//  FocusTime
//
//  Created by José Tony on 14/09/23.
//

import SwiftUI

@main
struct FocusTimeApp: App {
  @StateObject var appCountDown = CountdownConfigModel()
  
  var body: some Scene {
    MenuBarExtra {
      ContentView()
        .environmentObject(appCountDown)
    } label: {
      if appCountDown.remainingTime != nil {
        AppBarCountDownView()
          .environmentObject(appCountDown)
      } else {
        Text("PoTi")
      }
    }
    .menuBarExtraStyle(.window)
  }
}


