//
//  SlidingTabsDemoView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 07/09/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

struct SlidingTabsDemoView: View {
  @State var currentTab: Int = 0
  
  var body: some View {
    
    ZStack(alignment: .top) {
      VStack(spacing: 0.0) {
        SlidingTabsView(tabBarOptions: ["Hello World",
                                        "Sample Tab",
                                        "Something cool that I'm doing"],
                        currentTab: self.$currentTab)
        
        TabView(selection: self.$currentTab) {
          Color.orange.tag(0).overlay {
            Text("First Tab")
          }
          Color.cyan.tag(1).overlay {
            Text("Second Tab")
          }
          Color.mint.tag(2).overlay {
            Text("Third Tab")
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
      }
    }
  }
}

struct SlidingTabsDemoView_Previews: PreviewProvider {
  static var previews: some View {
    SlidingTabsDemoView()
  }
}
