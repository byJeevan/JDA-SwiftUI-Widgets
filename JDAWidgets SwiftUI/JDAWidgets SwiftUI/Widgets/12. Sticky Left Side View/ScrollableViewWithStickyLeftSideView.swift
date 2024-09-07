//
//  ScrollableViewWithStickyLeftSideView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 07/09/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

struct ScrollableViewWithStickyLeftSideView: View {
  
  @State private var scrollOffset: CGFloat = 0
  
  var body: some View {
    VStack(spacing: 0) {
      ScrollView {
        
        // Header view (non-sticky)
        Color.yellow
          .frame(maxWidth: .infinity, minHeight: 200)
        Color.green
          .frame(maxWidth: .infinity, minHeight: 250)
        
        // IMPORTANT: Calculation of scroll offset
        VStack(spacing: 0) {
          GeometryReader { geo -> Color in
            DispatchQueue.main.async {
              self.scrollOffset = geo.frame(in: .global).minY
            }
            return Color.clear
          }
          .frame(height: 0)
          
          // Split view
          HStack(spacing: 0) {
           
            // Gray Box Sticky area.
            VStack {
              Color.gray
                .frame(height: 300)
                .offset(y: max(-scrollOffset, 0)) // Sticky behavior
              Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.3) // 30% of width.
            VStack {
              
              // Blue Scrollable area
              Color.cyan
                .frame(height: 1000)
              Color.blue
                .frame(height: 400)
              Color.purple
                .frame(height: 600)
            }
            .frame(width: UIScreen.main.bounds.width * 0.7) // 70% of width.
          }
        }
      }
    }
    .ignoresSafeArea(edges: .top)
  }
}

struct ScrollableViewWithStickyLeftSideView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollableViewWithStickyLeftSideView()
  }
}

 
