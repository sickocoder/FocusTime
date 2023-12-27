//
//  ContentView.swift
//  FocusTime
//
//  Created by José Tony on 14/09/23.
//

import SwiftUI

let numberOfFocusSections = [1, 2, 3, 4]
let sectionDurations = [25, 30, 60]
let sectionRestIntervals = [5, 10]

struct ContentView: View {
  @EnvironmentObject var appCountdownConfig: CountdownConfigModel
  
  @State private var selectedNumberOfSections: Int = 2
  @State private var selectedSectionDurations: Int = 25
  @State private var selectedRestInterval: Int = 5
  
  @State private var isClockRuning: Bool = false
  
  var body: some View {
    VStack {
      HStack {
        Text("Focus Time")
          .font(.title)
          .bold()
        
        if !isClockRuning {
          Spacer()
        }
      }
      .padding(.bottom)
      
      if isClockRuning && appCountdownConfig.remainingTime != nil {
        CountDown() {
          print("a session finished")
        } onSessionStart: {
          print("a session is about to start")
        } onCountFinish: {
          print("the countdown has ended")
          isClockRuning.toggle()
        }
      } else {
        FormPicker(
          dataset: numberOfFocusSections,
          label: "Number of Sections",
          value: $selectedNumberOfSections
        )
        
        FormPicker(
          dataset: sectionDurations,
          label: "Section Duration",
          value: $selectedSectionDurations
        )
        
        FormPicker(
          dataset: sectionRestIntervals,
          label: "Rest Interval",
          value: $selectedRestInterval
        )
        
        Button {
          withAnimation {
            isClockRuning.toggle()
            appCountdownConfig.remainingTime = selectedSectionDurations * 60
            appCountdownConfig.selectedSectionDuration = selectedSectionDurations * 60
          }
        } label: {
          Text("Start")
            .frame(maxWidth: .infinity, maxHeight: 30)
            .frame(height: 25)
        }
        .buttonStyle(.borderedProminent)
        .padding(.top)
      }

    }
    .padding()
    .frame(minWidth: 300)
    .frame(height: 220)
  }
}

#Preview {
  ContentView()
}

