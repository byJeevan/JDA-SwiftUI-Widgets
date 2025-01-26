//
//  CarouselDemoView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 26/01/25.
//  Copyright © 2025 JDA. All rights reserved.
//

import SwiftUI

struct ExampleTextItem: Identifiable {
  let id = UUID()
  let title: String
}

struct ExampleImageItem: Identifiable {
  let id = UUID()
  let imageURL: URL
}

struct CarouselDemoView: View {
  
  var exampleTextData = [
    ExampleTextItem(title: "Slide 1"),
    ExampleTextItem(title: "Slide 2"),
    ExampleTextItem(title: "Slide 3")
  ]
  
  var exampleImageData = [
    ExampleImageItem(imageURL: URL(string: "https://images.pexels.com/photos/808941/pexels-photo-808941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")!),
    ExampleImageItem(imageURL: URL(string: "https://images.pexels.com/photos/769969/pexels-photo-769969.jpeg?auto=compress&cs=tinysrgb&w=1200")!),
    ExampleImageItem(imageURL: URL(string: "https://images.pexels.com/photos/691114/pexels-photo-691114.jpeg?auto=compress&cs=tinysrgb&w=1200")!)
  ]
  
  @State private var selectedTextIndex: Int = 0  // Tracks the current Text index
  @State private var selectedImageIndex: Int = 0  // Tracks the current Image index
  
  var body: some View {
    
    VStack {
      CarouselView(
        data: exampleTextData,
        content: { item in
          Text(item.title)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.6))
            .cornerRadius(6)
            .padding()
        },
        currentIndex: $selectedTextIndex,
        autoPlay: false,
        autoPlayInterval: 3.0,
        pageControlStyle: .system
      )
      .frame(height: 250)
      
      CarouselView(
        data: exampleImageData,
        content: { item in
          AsyncImage(
            url: item.imageURL,
            content: { image in
              image
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
            },
            placeholder: {
              ProgressView() // A loading spinner
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
          ).onTapGesture {
            print("Tapped \(selectedImageIndex)")
          }
        },
        currentIndex: $selectedImageIndex,  // Bind to parent state
        autoPlay: true,
        autoPlayInterval: 5.0,
        pageControlStyle: .custom
      )
      .frame(height: 250)
      
      // Display or control the current index in the parent view
      Text("Current Image Index: \(selectedImageIndex)")
        .font(.headline)
        .padding()
    }
    
  }
}

#Preview {
    CarouselDemoView()
}
