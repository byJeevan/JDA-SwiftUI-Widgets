//
//  BottomToTopSheetView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 21/07/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

enum BottomToTopSheetConstant {
  static let sheetHeight = 300.0
}

struct BottomToTopSheetView: View {

  @State private var startBgAnimation = false


  var body: some View {

    ZStack {

      // Demo button to open the sheet
      Button("Open Sheet") {
        withAnimation {
          startBgAnimation.toggle()
        }
      }

      // Bottom card
      BottomToTopSheetContentView(startBgAnimation: $startBgAnimation)
    }
    .edgesIgnoringSafeArea(.all)
    .background(startBgAnimation ? Color.black.opacity(0.33) : Color.clear)
    .onTapGesture {
      withAnimation {
        startBgAnimation = false
      }
    }
  }
}

struct BottomToTopSheetContentView: View {

  @Binding var startBgAnimation: Bool

  var body: some View {

    VStack {

      Spacer()

      if startBgAnimation {
        // Add here the contents of the card.
        VStack(spacing: 20) {

          Text("Hello, World!").bold()

          // optional dismiss
          Button("Dismiss Sheet") {
            withAnimation {
              startBgAnimation = false
            }
          }

        }
        .frame(height: BottomToTopSheetConstant.sheetHeight)
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
        .transition(.move(edge: .bottom))
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }

}


#Preview {
  BottomToTopSheetView()
}



