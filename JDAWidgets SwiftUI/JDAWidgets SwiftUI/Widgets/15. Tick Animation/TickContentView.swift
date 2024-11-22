//
//  TickContentView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 22/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

enum TickAnimationConstants {
  static let circleEndDuration: CGFloat = 0.4
  static let scaleEndDuration: CGFloat = 0.3
  static let tickDuration: CGFloat = 0.3
  static let circleSize: CGFloat = 125.0
}

struct CircleView: View {
  var progress: Double
  var lineWidth: CGFloat
  
  var body: some View {
    Circle()
      .trim(from: 0, to: CGFloat(progress))
      .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
      .frame(width: TickAnimationConstants.circleSize, height: TickAnimationConstants.circleSize)
      .clipShape(Circle())
  }
}


struct TickShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    // Define the points of the tick based on the rectangle size
    let start = CGPoint(x: rect.width * 0.25, y: rect.height * 0.5)
    let mid = CGPoint(x: rect.width * 0.4, y: rect.height * 0.7)
    let end = CGPoint(x: rect.width * 0.75, y: rect.height * 0.3)
    
    // Draw the tick
    path.move(to: start)
    path.addLine(to: mid)
    path.addLine(to: end)
    
    return path
  }
}

struct TickContentView: View {
  
  @State private var progress: Double = 0.1
  @State private var lineWidth: CGFloat = 10
  @State private var drawTickWithAnimation = false
  @State private var scaleUpWhenTickMarked = false
  
  private func startAnimation() {
    progress = 0.1
    lineWidth = 10
    drawTickWithAnimation = false
  }
  
  var body: some View {
    ZStack {
      CircleView(progress: progress,
                 lineWidth: lineWidth)
      .foregroundColor(.green)
      .scaleEffect(scaleUpWhenTickMarked ? 1.15 : 1)  // Scale up cricle by 15%
      .onAppear {
        
        // 1. Green circle outline
        withAnimation(.linear(duration: TickAnimationConstants.circleEndDuration)) {
          progress = 1
        }
        
        // 2. fill animation
        DispatchQueue.main.asyncAfter(deadline: .now() + TickAnimationConstants.circleEndDuration) {
          lineWidth = TickAnimationConstants.circleSize
        }
        
        // 3. Draw tick + scale cricle
        DispatchQueue.main.asyncAfter(deadline: .now() + TickAnimationConstants.tickDuration) {
          
          drawTickWithAnimation = true
          
          withAnimation {
            scaleUpWhenTickMarked = true
          }
          
          // 4. Reset scale back after scale ended
          DispatchQueue.main.asyncAfter(deadline: .now() + TickAnimationConstants.scaleEndDuration) {
            withAnimation {
              scaleUpWhenTickMarked = false
            }
          }
        }
      }
      
      TickShape()
        .trim(from: 0, to: drawTickWithAnimation ? 1 : 0)  // Animate the trim
        .stroke(Color.white, lineWidth: 9)
        .frame(width: TickAnimationConstants.circleSize ,
               height: TickAnimationConstants.circleSize * 0.8) // Adjust to center within circle
        .animation(.easeInOut(duration: TickAnimationConstants.tickDuration), value: drawTickWithAnimation)
      
    }
  }
}
