//
//  CountryPicker.swift
//  JDA Country Picker
//
//  Created by Jeevan on 04/07/20.
//  Copyright © 2020 JDA. All rights reserved.
//

import SwiftUI


struct CountryPicker: View {

    @State var selectedCountry = ""
    @State var selectedFlag: Image?
    var placeholder = "Select Country"
    var dropDownList = Country.countryNamesByCode()
    
    var body: some View {
        Menu {
            ForEach(dropDownList, id: \.self) { client in
                Button(action: {
                    self.selectedCountry = client.name
                    self.selectedFlag = client.flag
                }) {
                    
                    HStack{
                        Text(client.name)
                            .foregroundColor(client.name.isEmpty ? .gray : .black)
                        Spacer()
                        
                        client.flag
                    }
                    .padding(.horizontal)
                    
                }
            }
 
        } label: {
            
            VStack(spacing: 5){
                HStack{
                    selectedFlag
                    
                    Text(selectedCountry.isEmpty ? placeholder : selectedCountry)
                        .foregroundColor(selectedCountry.isEmpty ? .gray : .black)
                    
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

struct CountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CountryPicker()
    }
}




