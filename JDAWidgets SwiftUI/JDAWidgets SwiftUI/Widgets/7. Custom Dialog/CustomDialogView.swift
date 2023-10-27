//
//  CustomDialogView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 27/10/23.
//  Copyright © 2023 JDA. All rights reserved.
//

import SwiftUI

struct CustomDialogView: View {
  
  @State private var offset: CGFloat = 1000

  let title: String
  let message: String
  let buttonTitle: String
  let action: () -> ()
  let dismissed: () -> ()

  var body: some View {
    ZStack {
      
      Color(.black)
        .opacity(0.5)
        .onTapGesture {
          close()
        }
      
      // You can modifiy contents of alert dialog
      VStack {
        Text(title)
          .font(.title2)
          .bold()
          .padding()
        
        Text(message)
          .font(.body)
        
        Button {
          action()
          close()
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 20)
              .foregroundColor(.purple)
            
            Text(buttonTitle)
              .font(.system(size: 16, weight: .bold))
              .foregroundColor(.white)
              .padding()
          }
          .padding()
        }
      }
      .fixedSize(horizontal: false, vertical: true)
      .padding()
      .background(.white)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .overlay(alignment: .topTrailing) {
        Button {
          close()
        } label: {
          Image(systemName: "xmark")
            .font(.title2)
        }
        .tint(.black)
        .padding()
      }
      .shadow(radius: 20)
      .padding(30)
      .offset(x: 0, y: offset)
      .onAppear {
        withAnimation(.spring()) {
          offset = 0
        }
      }.onDisappear {
        offset = 1000
      }
    }
    .ignoresSafeArea()
  }
  
  func close() {
    offset = 1000
    dismissed()
  }
}

