//
//  StarRatingView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 11/05/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

// MARK: -  Widget
struct StarRatingView: View {
  @Binding var rating: Int
  
  var body: some View {
    HStack {
      ForEach(1...5, id: \.self) { index in
        Image(systemName: index <= self.rating ? "star.fill" : "star")
          .foregroundColor(index <= self.rating ? .yellow : .gray)
          .onTapGesture {
            self.rating = index
          }
      }
    }
  }
}

// MARK: - Example Usage
struct StarRatingDemoView: View {
  @State private var rating = 0
  
  var body: some View {
    VStack {
      StarRatingView(rating: $rating)
      Text("You rated \(rating) stars").bold().padding()
    }
    .padding()
  }
}

// MARK: - Preview
struct StarRatingDemoView_Previews: PreviewProvider {
  static var previews: some View {
    StarRatingDemoView()
  }
}
