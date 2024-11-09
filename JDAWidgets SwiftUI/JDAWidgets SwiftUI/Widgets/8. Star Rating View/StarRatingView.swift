//
//  StarRatingView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 09/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

// MARK: -  StarRatingView Widget
struct StarRatingView: View {
  @Binding var rating: Int
  
  var body: some View {
    HStack {
      ForEach(1...5, id: \.self) { index in
        Image(systemName: index <= self.rating ? "star.fill" : "star")
          .font(Font.system(size: 30)) // Adjusting size of icon
          .foregroundColor(index <= self.rating ? .yellow : .gray)
          .onTapGesture {
            self.rating = index
          }
      }
    }
  }
}
