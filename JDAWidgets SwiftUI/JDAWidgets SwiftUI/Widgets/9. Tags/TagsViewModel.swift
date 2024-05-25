//
//  TagsViewModel.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 25/05/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Widget
struct Tag: Identifiable, Hashable {
  var id = UUID().uuidString
  var name: String
  var size: CGFloat = 0
}

extension String {
  func getSize() -> CGFloat {
    let font = UIFont.systemFont(ofSize: 16)
    let attributes = [NSAttributedString.Key.font: font]
    let size = (self as NSString).size(withAttributes: attributes)
    return size.width
  }
}

final class TagsViewModel: ObservableObject {
  
  @Published var rows: [[Tag]] = []
  @Published var tags: [Tag] = [Tag(name: "XCode")] // You can initialise Tag(name: "XCode") etc
  
  init(){
    renderTags()
  }
  
  func renderTags(){
    var rows: [[Tag]] = []
    var currentRow: [Tag] = []
    
    var totalWidth: CGFloat = 0
    
    let screenWidth = UIScreen.screenWidth - 10
    let tagSpaceing: CGFloat = 14 /*Leading Padding*/ + 30 /*Trailing Padding*/ + 6 + 6 /*Leading & Trailing 6, 6 Spacing*/
    
    
    if !tags.isEmpty{
      
      for index in 0..<tags.count{
        self.tags[index].size = tags[index].name.getSize()
      }
      
      tags.forEach{ tag in
        
        totalWidth += (tag.size + tagSpaceing)
        
        if totalWidth > screenWidth{
          totalWidth = (tag.size + tagSpaceing)
          rows.append(currentRow)
          currentRow.removeAll()
          currentRow.append(tag)
        }else{
          currentRow.append(tag)
        }
      }
      
      if !currentRow.isEmpty{
        rows.append(currentRow)
        currentRow.removeAll()
      }
      
      self.rows = rows
    }else{
      self.rows = []
    }
    
  }
  
  func insertTag(_ tagText: String) {
    tags.append(Tag(name: tagText))
    renderTags()
  }
  
  func removeTag(by id: String){
    tags = tags.filter{ $0.id != id }
    renderTags()
  }
  
}
