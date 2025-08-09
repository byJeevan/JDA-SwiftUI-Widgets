//
//  AsyncImageLoader.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 09/08/25.
//  Copyright © 2025 JDA. All rights reserved.
//

import SwiftUI
import Combine

final class AsyncImageLoader: ObservableObject {
  @Published var image: UIImage?
  @Published var error: Error?
  
  private var cancellable: AnyCancellable?
  
  func load(from url: URL,
            timeout: TimeInterval = 15,
            completion: ((Result<UIImage, Error>) -> Void)? = nil) {
    
    // Cancel any previous request
    cancel()
    
    // 1. Check cache first
    if let cached = ImageCache.shared.image(for: url) {
      self.image = cached
      completion?(.success(cached))
      return
    }
    
    // 2. Otherwise fetch from network
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .timeout(.seconds(timeout), scheduler: DispatchQueue.main, customError: { URLError(.timedOut) })
      .tryMap { output -> UIImage in
        guard let image = UIImage(data: output.data) else {
          throw URLError(.cannotDecodeContentData)
        }
        return image
      }
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completionState in
        guard let self else { return }
        if case .failure(let err) = completionState {
          self.error = err
          completion?(.failure(err))
        }
      }, receiveValue: { [weak self] downloaded in
        guard let self else { return }
        ImageCache.shared.insertImage(downloaded, for: url)
        self.image = downloaded
        completion?(.success(downloaded))
      })
  }
  
  func cancel() {
    cancellable?.cancel()
  }
}
