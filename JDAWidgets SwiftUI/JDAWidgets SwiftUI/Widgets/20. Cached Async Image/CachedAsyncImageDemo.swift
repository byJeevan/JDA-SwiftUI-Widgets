//
//  AsyncImageCacheExample.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 09/08/25.
//  Copyright © 2025 JDA. All rights reserved.
//

import SwiftUI

struct CachedAsyncImageDemo: View {
  @State private var imageURL = URL(string: "https://images.pexels.com/photos/3098619/pexels-photo-3098619.jpeg")!
  
  @State var isRefreshed: Bool = true
  var body: some View {
    VStack(spacing: 30) {
      
      if isRefreshed {
        
        Button("Refresh Image") {
          refreshHandle()
        }
        .buttonStyle(.bordered)
        
        Button("Clear Cache & Refresh") {
          ImageCache.shared.clearAll()
          refreshHandle()
        }
        .buttonStyle(.bordered)
        
        // 1
        VStack {
          Text("Normal Async Image")
          AsyncImage(url: imageURL) { phase in
            if let image = phase.image {
              image
                .resizable()
                .scaledToFit()
            } else if phase.error != nil {
              Color.red
            } else {
              ProgressView()
            }
          }
          .frame(width: 200, height: 200)
        }
        
        // 2
        VStack {
          Text("Cached Async Image")
          // Usage:
          CachedAsyncImage(url: imageURL) {
            ProgressView()
          }
          .scaledToFit()
          .frame(width: 200, height: 200)
        }
        
        
      } else {
        Spacer()
      }
      
    }
    .padding()
  }
  
  func refreshHandle() {
    isRefreshed = false
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
      isRefreshed = true
    }
  }
}

#Preview {
  CachedAsyncImageDemo()
}
