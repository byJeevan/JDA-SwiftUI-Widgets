//
//  Dropdown.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 18/12/21.
//  Copyright © 2021 JDA. All rights reserved.
//

import SwiftUI

struct Dropdown: View {
    
    @State var value = ""
    var placeholder = "Select DC Superheros"
    var dropDownList = ["Superman", "Batman", "Aquaman", "Flash"]
    var body: some View {
        Menu {
            ForEach(dropDownList, id: \.self){ client in
                Button(client) {
                    self.value = client
                }
           
            }
        } label: {
            
            VStack(spacing: 5){
                HStack{
                    Text(value.isEmpty ? placeholder : value)
                        .foregroundColor(value.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.gray.opacity(0.33))
                        .font(Font.system(size: 20, weight: .semibold))
                }
                .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.33))
                    .frame(height: 1)
            }
        }
        .frame(width: 300)
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown()
    }
}
