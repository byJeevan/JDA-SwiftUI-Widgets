//
//  TagsContentView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 25/05/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

/// Creates tag view dynamically and when overflows the rows will be increased vertically.
struct TagsContentView: View {
  
  @ObservedObject var viewModel: TagsViewModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      ForEach(viewModel.rows, id:\.self) { rows in
        HStack(spacing: 6){
          ForEach(rows){ row in
            Text(row.name)
              .font(.system(size: 16))
              .padding(.leading, 14)
              .padding(.trailing, 30)
              .padding(.vertical, 8)
              .background(
                ZStack(alignment: .trailing) {
                  Capsule()
                    .fill(.gray.opacity(0.3))
                  Button{
                    viewModel.removeTag(by: row.id)
                  } label:{
                    Image(systemName: "xmark")
                      .frame(width: 15, height: 15)
                      .padding(.trailing, 8)
                      .foregroundColor(.red)
                  }
                }
              )
          }
          Spacer()
        }
        .frame(height: 28)
        .padding(.bottom, 10)
      }
    }
    
  }
}
