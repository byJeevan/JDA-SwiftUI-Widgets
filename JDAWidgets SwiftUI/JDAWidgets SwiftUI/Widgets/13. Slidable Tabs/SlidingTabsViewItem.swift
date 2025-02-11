//
//  SlidingTabsViewItem.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 09/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//
import SwiftUI

struct SlidingTabsViewItem: View {
  @Binding var currentTab: Int
  
  let namespace: Namespace.ID
  var tabBarItemName: String
  var tab: Int
  
  var body: some View {
    Button {
      self.currentTab = tab
      
    } label: {
      VStack {
        Spacer()
        Text(tabBarItemName)
          .font(.title2)
        if currentTab == tab {
          Color.black
            .frame(height: 2)
            .matchedGeometryEffect(id: "underline",
                                   in: namespace,
                                   properties: .frame)
          
        } else {
          Color.clear.frame(height: 2)
        }
      }
      .animation(.spring(), value: self.currentTab)
    }
    .buttonStyle(.plain)
  }
}
