//
//  TinderSwipeView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 09/09/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

struct TinderSwipeView: View {
  
  private var items: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
  
  var body: some View {
    VStack {
      ZStack {
        ForEach(items, id: \.self) { person in
          CardView(item: person)
        }
      }
    }
  }
}

struct CardView: View {
  var item: String
  @State private var offset = CGSize.zero
  @State private var color: Color = .black
  
  var body: some View {
    VStack {
      ZStack {
        Rectangle()
          .frame(width: 320, height: 420)
          .border(.white, width: 6.0)
          .cornerRadius(4)
          .foregroundStyle(color.opacity(0.9))
          .shadow(radius: 4)
        
        HStack {
          Text(item)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
        }
      }
    }
    .offset(CGSize(width: offset.width, height: offset.height * 0.4))
    .rotationEffect(.degrees(Double(offset.width / 40)))
    .gesture(
      DragGesture().onChanged{ guesture in
        offset = guesture.translation
        
        withAnimation {
          changeColor(width: offset.width)
        }
        
      }.onEnded{ _ in
        withAnimation {
          swipeCard(width: offset.width)
          changeColor(width: offset.width)
        }
      }
      
    )
  }
  
  func swipeCard(width: CGFloat) {
    switch width {
      case -500...(-150):
        print("\(item) removed")
        offset = CGSize(width: -500, height: 0)
      case 150...500:
        print("\(item) added")
        offset = CGSize(width: 500, height: 0)
      default:
        offset = .zero
    }
  }
  
  func changeColor(width: CGFloat) {
    switch width {
      case -500...(-130):
        color = .red
      case 130...500:
        color = .green
      default:
        color = .black
    }
  }
}

#Preview {
  TinderSwipeView()
}
