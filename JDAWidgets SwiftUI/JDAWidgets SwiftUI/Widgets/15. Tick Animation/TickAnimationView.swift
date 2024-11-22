//
//  TickAnimationView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 22/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

struct TickAnimationDemoView: View {
  
  @State private var isAnimating = true
  
  var body: some View {
  
    ZStack {
    
      if isAnimating {
        TickContentView()
      }
   
      Button {
        isAnimating.toggle()
      } label: {
        Text("Toggle Animation")
          .font(.title2)
      }
      .padding(.top, 250)
    }
    .frame(maxHeight: .infinity)
  }
}

#Preview {
  TickAnimationDemoView()
}
