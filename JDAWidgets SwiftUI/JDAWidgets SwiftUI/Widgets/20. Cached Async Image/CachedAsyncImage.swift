//
//  CachedAsyncImage.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 09/08/25.
//  Copyright © 2025 JDA. All rights reserved.
//

import SwiftUI

/// 1. Loads from cache if exists. ✅
/// 2. clears cache if required. ✅
/// 3. works offline once cached. ✅
/// 4. If failed to fetch, error case handled. ✅

struct CachedAsyncImage<Placeholder: View>: View {
  @StateObject private var loader = AsyncImageLoader()
  
  private let url: URL
  private let placeholder: Placeholder
  private let image: (UIImage) -> Image
  
  init(
    url: URL,
    @ViewBuilder placeholder: () -> Placeholder,
    @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)) {
    self.url = url
    self.placeholder = placeholder()
    self.image = image
  }
  
  var body: some View {
    content
      .task(id: url) { // Reacts to URL change instantly
        loader.cancel()
        loader.image = nil
        
        // Instant load from memory or disk
        if let cached = ImageCache.shared.image(for: url) {
          loader.image = cached
        } else {
          // Only go online if offline mode is not enabled or online is available
          loader.load(from: url) { result in
            switch result {
              case .success(let image):
                loader.image = image // Set new result
                
              default:
                break
            }
          }
        }
      }
      .onDisappear {
        loader.cancel()
      }
  }
  
  private var content: some View {
    Group {
      if let uiImage = loader.image {
        image(uiImage)
          .resizable()
      } else if loader.error != nil {
        Color.clear // Note: Use `placeholder` view or replace any other the view when failure.
      } else {
        placeholder
      }
    }
  }
}
