//
//  SlidingTabsView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 07/09/24.
//  Original Author by Jared Davidson on 10/14/21.
//  Reference: https://github.com/Archetapp/UnderlineTabBarFinal
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

struct SlidingTabsView: View {
  
  var tabBarOptions: [String]
  @Binding var currentTab: Int
  @Namespace var namespace
  
  var body: some View {
    
    ScrollViewReader { scrollViewReader in
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(Array(zip(self.tabBarOptions.indices,
                            self.tabBarOptions)),
                  id: \.0,
                  content: { index, name in
            SlidingTabsViewItem(currentTab: self.$currentTab,
                                namespace: namespace.self,
                                tabBarItemName: name,
                                tab: index)
            
          })
        }
        .padding(.horizontal)
        .onChange(of: currentTab) { tab in
          
          withAnimation(.linear(duration: 1)) {
            scrollViewReader.scrollTo(
              tab,
              anchor: .top
            )
          }
        }
      }
      .background(Color.black.opacity(0.33))
      .frame(height: 80)
      
    }
    
  }
}
