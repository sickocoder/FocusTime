//
//  CountDown.swift
//  FocusTime
//
//  Created by José Tony on 14/09/23.
//

import SwiftUI

struct CountDown: View {
  @EnvironmentObject var appConfig: CountdownConfigModel
  
  var onSessionFinished: () -> ()
  var onSessionStart: () -> ()
  var onCountFinish: () -> ()
  
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack {
      Text("\(appConfig.countDownText)")
        .font(.system(size: 60))
        .bold()
        .onReceive(timer) { _ in
          if (appConfig.remainingTime == nil) {
            return
          }
          
          if appConfig.remainingTime! > 0 {
            appConfig.remainingTime! -= 1
          } else if appConfig.currentSection <= appConfig.numberOfSections {
            appConfig.remainingTime = appConfig.selectedSectionDuration
            appConfig.currentSection += 1
          }
        }
      
      
      Text("Session \(appConfig.currentSection)")
        .font(.title3)
        .opacity(0.7)
      
      Button {
        withAnimation {
          appConfig.remainingTime = nil
          onCountFinish()
        }
        
      } label: {
        Text("Stop!")
          .frame(maxWidth: .infinity, maxHeight: 30)
          .frame(height: 25)
      }
      .buttonStyle(.borderedProminent)
      
    }
    .onAppear {
      onSessionStart()
    }
  }
}

#Preview {
  CountDown() {
    print("a session finished")
  } onSessionStart: {
    print("a session is about to start")
  } onCountFinish: {
    print("the countdown has ended")
  }
  .frame(width: 300, height: 250)
  
}



