//
//  RichTextDemoView.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 22/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

struct RichTextDemoView: View {
  
  var body: some View {
    
    VStack {
      
      Divider().padding()
      
      RichTextView(.markdown("""
 Markdown Testing:
 **Bold**
 *Italics*
 ~Strikethrough~
 `Code`
 [Link](https://apple.com)
 ***[They](https://apple.com) ~are~ `combinable`***
 """))
      
      Divider().padding()
      
      RichTextView(.html("""
 <style>
 * {
 font-family:verdana;
 font-size: 26pt;
 }
 </style>
 <body>
 <p>Html Testing:</p>
 <p><b>Bold</b> </p>
 <p><i>Italics</i> </p>
 <p><s>Strikethrough</s></p>
 <p><a href="https://apple.com" target="_blank">Link Text</a></p>
 <p><b><i><s><a href="https://example.com" target="_blank">Styled Link</a></s></i></b></p>
 <body>
 """))
    }
    .frame(maxWidth: .infinity)
    
  }
  
}

// Preview in SwiftUI
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    RichTextDemoView()
  }
}
