//
//  CountryPicker.swift
//  JDA Country Picker
//
//  Created by Jeevan on 04/07/20.
//  Copyright © 2020 JDA. All rights reserved.
//

import SwiftUI

struct CountryPicker: View {
    
    @State var isPickerSelected = false
    @State private var selectedCountry = -1
    @State private var selectedCountryValue:Country? = nil
    
    var countries = Country.countryNamesByCode()
    
    private func pickerFieldButton() -> some View {
        
        return  Button(action: {
            self.isPickerSelected = !self.isPickerSelected
            
        }) {
            
            if selectedCountryValue == nil {
                Text("Select Country  🚩")
                    .font(.headline)
                    .background(Color.white)
                    .foregroundColor(Color.gray)
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50)
            }
            else{
                HStack {
                    selectedCountryValue?.flag?.renderingMode(.original).cornerRadius(5.0).padding(5)

                    Text(selectedCountryValue?.name ?? "").font(.headline)
                    Spacer()
                    Text("(\(selectedCountryValue?.phoneCode ?? ""))")
                    }.frame(minWidth: 100, maxWidth: .infinity, minHeight: 50).padding(15)

            }
            
        }.background( RoundedRectangle(cornerRadius: 15)
        .foregroundColor(Color.white)
        .shadow( color: Color.gray.opacity(0.35), radius: 15, x: 0, y: 0))
    }
      
    private func pickerFooterButton() -> some  View {
        return HStack {
            Button(action: {
                self.isPickerSelected = !self.isPickerSelected
                self.selectedCountryValue = self.countries[self.selectedCountry]
            }) {
                HStack {
                    Text("GO !")
                        .padding(EdgeInsets.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .foregroundColor(.white)
                        .background(Color.green)
                        .font(Font.subheadline)
                        .cornerRadius(5.0)
                    
                }
                
            }.padding(15)
            
        }
    }
    
    private func pickerRow(_ country:Country) -> some View {
        return HStack {
            country.flag?.resizable().scaledToFit().cornerRadius(5.0)
            Text(country.name ?? "")
            Spacer()
            Text("(\(country.phoneCode ?? ""))")
        }.padding(10)
    }
    
    private func pickerView() -> some View {
        return
            Picker("", selection: $selectedCountry) {
                ForEach(0 ..< countries.count) {
                    self.pickerRow(self.countries[$0])
                }
        }.labelsHidden()

    }
    
    var body: some View {
        VStack {
            
            self.pickerFieldButton()
            
            if isPickerSelected == true {
                VStack{
                    
                    self.pickerView().padding([.leading, .trailing], 20)
                    
                    self.pickerFooterButton().padding([.leading, .trailing], 20)
                    
                }   .background( RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.white)
                    .shadow( color: Color.gray.opacity(0.35), radius: 15, x: 0, y: 0))
            }
            
        }.padding(30)
    }
}

struct CountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CountryPicker()
    }
}




