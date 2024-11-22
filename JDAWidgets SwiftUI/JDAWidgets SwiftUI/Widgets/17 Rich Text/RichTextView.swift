//
//  RichTextView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 22/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI
import WebKit

// 1. Create a UIViewRepresentable to embed a WKWebView in SwiftUI
struct HTMLView: UIViewRepresentable {
  let htmlContent: String
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    return webView
  }
  
  func updateUIView(_ webView: WKWebView, context: Context) {
    // Load the HTML content into the WKWebView
    webView.loadHTMLString(htmlContent, baseURL: nil)
  }
}

struct RichTextView: View {
  
  enum ContentType {
    case markdown(String)
    case html(String)
  }
  
  let content: ContentType
  
  init(_ content: ContentType) {
    self.content = content
  }
  
  var body: some View {
    Group {
      switch content {
        case .markdown(let markdownText):
          Text(LocalizedStringKey(markdownText))
        case .html(let htmlText):
          HTMLView(htmlContent: htmlText)
      }
    }
  }
}
