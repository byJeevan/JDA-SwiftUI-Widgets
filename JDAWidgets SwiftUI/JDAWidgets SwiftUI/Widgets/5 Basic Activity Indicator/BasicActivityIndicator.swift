//
//  BasicActivityIndicator.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 15/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//

import SwiftUI

struct BasicActivityIndicator: View {
    @State var animationSwitch: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
           
            ActivityIndicatorCustom(animate: $animationSwitch)
 
            Button("Toggle Spinner") {
                animationSwitch.toggle()
            }
         
        }
    }
}

/// From `UIViewRepresentable`
struct ActivityIndicatorCustom: UIViewRepresentable {
    
    @Binding var animate: Bool

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorCustom>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
     
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorCustom>) {
        animate ?  uiView.startAnimating() : uiView.stopAnimating()
       
    }
}


struct BasicActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        BasicActivityIndicator(animationSwitch: false)
    }
}

