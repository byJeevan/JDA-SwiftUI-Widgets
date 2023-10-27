//
//  CustomDialogExampleView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 27/10/23.
//  Copyright © 2023 JDA. All rights reserved.
//

import SwiftUI

struct CustomDialogExampleView: View {
  @State var isActive: Bool = false

  var body: some View {
    ZStack {
      VStack {
        Button {
          isActive = true
        } label: {
          Text("Show popup")
        }
      }
      .padding()
      
      if isActive {

        CustomDialogView(title: "Are you sure?",
                         message: "This confirmation dialog will be used take user input for further actions.",
                         buttonTitle: "Let's Go") {
          print("Button Tapped.")
        } dismissed: {
          print("Dismissed")
          isActive = false
        }
      }

    }
  }
}
