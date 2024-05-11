//
//  FloatingButton.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 18/12/21.
//  Copyright © 2021 JDA. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    @State var isExpanded = false
    
    var body: some View {
        VStack {
            Spacer()
            if isExpanded {
           
                MenuButtons(buttonImage: "camera.fill") {
                    print("Camera Tapped.")
                    isExpanded = false
                }
                
                MenuButtons(buttonImage: "photo") {
                    print("Photo Tapped.")
                    isExpanded = false
                }
                
                MenuButtons(buttonImage: "record.circle.fill") {
                    print("Album Tapped.")
                    isExpanded = false
                }
            }
            
            Button(action: {
                print("Expandable button tapped!!!")
                isExpanded.toggle()
                
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.green)
                    .rotationEffect(Angle.degrees(isExpanded ? 45 : 0))
            }
        }.animation(.spring())
        
    }
    
    struct MenuButtons: View {
        var buttonImage: String
        var buttonAction: (()-> Void)
        
        var body: some View {
            Button(action: {
                print("Menu Button tapped")
                buttonAction()
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: buttonImage)
                        .imageScale(.large)
                        .foregroundColor(.white)
                    
                }
                
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
