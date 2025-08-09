//
//  ImageCache.swift
//  SwiftUI Playground
//
//  Created by Jeevan Rao on 08/08/25.
//

import UIKit
import SwiftUI

final class ImageCache {
  static let shared = ImageCache()

  private init() {}

  private let cache = NSCache<NSURL, UIImage>()

  func image(for url: URL) -> UIImage? {
    cache.object(forKey: url as NSURL)
  }

  func insertImage(_ image: UIImage?, for url: URL) {
    guard let image else { return }
    cache.setObject(image, forKey: url as NSURL)
  }

  func clearAll() {
    cache.removeAllObjects()
  }
}
