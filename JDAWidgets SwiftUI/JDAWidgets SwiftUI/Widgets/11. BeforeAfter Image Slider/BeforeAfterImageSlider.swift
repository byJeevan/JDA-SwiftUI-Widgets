//
//  BeforeAfterImageSlider.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 31/08/24.
//  Copyright © 2024 JDA. All rights reserved.
//  Reference: https://stackoverflow.com/a/68608402 

import SwiftUI

struct BeforeAfterImageSlider: View {

  @State private var location = CGPoint.zero
  @State private var startPointX: CGFloat = 0
  @State private var endPointX: CGFloat = 0
  var containerSizeReader: CGSize

  private let stepValueForAccessibility = 10.0
  private let thumbWidthHeight = 30.0
  private let thumbLineThickness = 3.5

  var body: some View {

    VStack {

      ZStack(alignment: .center) {

        Image("Image2")
          .resizable()
          .background(Color.blue)

        Image("Image2-gray")
          .resizable()
          .background(Color.red)
          .mask(
            HStack {
              Spacer()
              Rectangle()
                .frame(width: containerSizeReader.width,
                       height: containerSizeReader.height)
                .offset(x: location.x - 4)
            }
          )

        sliderView
      }
      .clipped()
      .gesture(tapImitatingAction)
    }
    .frame(width: containerSizeReader.width,
           height: containerSizeReader.height)
    .onAppear {
      location = CGPoint(x: containerSizeReader.width / 2, 
                         y: containerSizeReader.height / 2)
      endPointX = containerSizeReader.width
    }
  }

  var dragAction: some Gesture {
    DragGesture()
      .onChanged { value in
        updateDragView(point: value.location)
      }
  }

  var tapImitatingAction: some Gesture {
    // Since versions below iOS 16.0 do not support tap guesture with coordinate space,
    // this is the alternative approach.
    DragGesture(minimumDistance: 0)
      .onEnded({ value in
        updateDragView(point: value.location)
      })
  }

  var sliderView: some View {
    VStack(spacing: 0) {
      Rectangle()
        .fill(Color.white)
        .frame(width: thumbLineThickness)
      Image(systemName: "circle.circle.fill")
        .foregroundColor(.white)
      Rectangle()
        .fill(Color.white)
        .frame(width: thumbLineThickness)
    }
    .position(location)
    .gesture(dragAction)
    .shadow(radius: 2)
  }

  func updateDragView(point: CGPoint) {
    if point.x > startPointX && point.x < endPointX {
      self.location = CGPoint(x: point.x, y: containerSizeReader.height / 2)
    }
  }
}

struct BeforeAfterImageSlider_Previews: PreviewProvider {
  static var previews: some View {
    BeforeAfterImageSlider(containerSizeReader: CGSize(width: 350, height: 250))
  }
}
