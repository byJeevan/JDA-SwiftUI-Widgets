//
//  CarouselView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 26/01/25.
//  Copyright © 2025 JDA. All rights reserved.
//

import SwiftUI

enum CarouselPageControlStyle {
  case system
  case custom
  case none
}

struct CarouselView<Item: Identifiable, Content: View>: View {
  let data: [Item]  // Accepts an array of Identifiable items
  let content: (Item) -> Content
  
  @Binding var currentIndex: Int
  
  var autoPlay: Bool
  var autoPlayInterval: TimeInterval
  var pageControlStyle: CarouselPageControlStyle
  
  @State private var timer: Timer? = nil
  
  // MARK: Initialiser
  init(data: [Item],
       @ViewBuilder content: @escaping (Item) -> Content,
       currentIndex: Binding<Int>,
       autoPlay: Bool = false,
       autoPlayInterval: TimeInterval = 3.0,
       pageControlStyle: CarouselPageControlStyle = .system) {
    self.data = data
    self.content = content
    self._currentIndex = currentIndex
    self.autoPlay = autoPlay
    self.autoPlayInterval = autoPlayInterval
    self.pageControlStyle = pageControlStyle
  }
  
  // MARK:
  var body: some View {
    GeometryReader { geometry in
      VStack {
        carouselCardsView(geometry)
        carouselPageControlls()
      }
      .onAppear {
        if autoPlay {
          startAutoPlay()
        }
      }
      .onDisappear {
        stopAutoPlay()
      }
    }
  }
  
}

private extension CarouselView {
  
  @ViewBuilder
  func carouselCardsView(_ geometry: GeometryProxy) -> some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $currentIndex) {
        ForEach(data.indices, id: \.self) { index in
          content(data[index])
            .frame(width: geometry.size.width,
                   height: geometry.size.height)
            .tag(index)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: pageControlStyle == .system ? .always : .never))
      .animation(.easeInOut, value: currentIndex)
    }
  }
  
  @ViewBuilder
  func carouselPageControlls() -> some View {
    if pageControlStyle == .custom {
      HStack(spacing: 8) {
        ForEach(data.indices, id: \.self) { index in
          Circle()
            .fill(index == currentIndex ? Color.primary : Color.secondary.opacity(0.5))
            .frame(width: 8, height: 8)
        }
      }.padding(.top, 8)
    }
  }
  
  func startAutoPlay() {
    stopAutoPlay()
    timer = Timer.scheduledTimer(withTimeInterval: autoPlayInterval, repeats: true) { _ in
      withAnimation {
        currentIndex = (currentIndex + 1) % data.count
      }
    }
  }
  
  func stopAutoPlay() {
    timer?.invalidate()
    timer = nil
  }
  
}
