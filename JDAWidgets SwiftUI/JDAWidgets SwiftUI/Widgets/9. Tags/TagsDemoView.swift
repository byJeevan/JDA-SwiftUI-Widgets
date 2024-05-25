//
//  TagsDemoView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 11/05/24.
//  Copyright © 2024 JDA. All rights reserved.
//
// Original Author : https://medium.com/geekculture/tags-view-in-swiftui-e47dc6ce52e8

import SwiftUI

// MARK: - Demo view
struct TagsDemoView: View {
  
  var testTags = ["Static 1", "Static 2"]
  
  @ObservedObject var viewModel = TagsViewModel()
  @State var enteredTagText: String = "Dynamic Tag"
  
  var body: some View {
    
    VStack {
      
      // Entering Tags dynamically
      Text("Enter Tag Here:")
        .padding()
      TextField("Enter tag", text: $enteredTagText, onCommit: {
        viewModel.insertTag(enteredTagText)
      })
      .padding()
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .strokeBorder()
          .foregroundColor(.black)
      )
      .padding()
      
      TagsContentView(viewModel: viewModel)
        .background(Color.yellow.opacity(0.1))
        .padding()
      
      Spacer()
    }
    .onAppear {
      // Pre-defined tags
      testTags.forEach { testTag in
        viewModel.insertTag(testTag)
      }
    }
  }
}

// MARK: - Preview
struct TagsDemoView_Previews: PreviewProvider {
  static var previews: some View {
    TagsDemoView()
  }
}
