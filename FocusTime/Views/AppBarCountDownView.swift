//
//  AppBarCountDownView.swift
//  FocusTime
//
//  Created by José Tony on 13/11/23.
//

import SwiftUI

struct AppBarCountDownView: View {
  @EnvironmentObject var appCountDown: CountdownConfigModel
  
  var body: some View {
    HStack(alignment: .center) {
      Text("\(appCountDown.countDownText)")
        .font(.system(size: 60))
    }
    .padding()
  }
}

#Preview {
  AppBarCountDownView()
}

