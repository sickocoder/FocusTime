//
//  FormPicker.swift
//  FocusTime
//
//  Created by José Tony on 14/09/23.
//

import SwiftUI

struct FormPicker: View {
  var dataset: [Int]
  var label: String
  @Binding var value: Int
  
  
  var body: some View {
    HStack {
      Text(label)
      Spacer()
      
      Picker("", selection: $value) {
        ForEach(dataset, id: \.self) { item in
          Text("\(item) minutes").tag(item)
        }
      }
    }
  }
}

#Preview {
  FormPicker(dataset:  [1, 2, 3], label: "", value: .constant(10))
}


