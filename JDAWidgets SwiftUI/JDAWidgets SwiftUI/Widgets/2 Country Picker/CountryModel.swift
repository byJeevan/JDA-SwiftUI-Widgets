//
//  CountryModel.swift
//  JDA Country Picker
//
//  Created by Jeevan on 04/07/20.
//  Copyright © 2020 JDA. All rights reserved.
//

import Foundation
import SwiftUI

struct Country: Hashable {
    
    var code: String
    var name: String
    var phoneCode: String
    var flag: Image? {
        guard let bundlePath = Bundle.main.path(forResource: "SwiftCountryPicker", ofType: "bundle") else { return nil }
        guard let bundle = Bundle(path: bundlePath)  else { return nil }
        guard let imagePath = bundle.path(forResource: "Images/\(code.uppercased())", ofType: "png") else { return nil }
        guard let uiImage = UIImage(contentsOfFile: imagePath) else { return nil }
        return Image.init(uiImage: uiImage)
    }
    
    // Populates the metadata from the included json file resource
    static func countryNamesByCode() -> [Country] {
        var countries = [Country]()
        if let bundlePath = Bundle.main.path(forResource: "SwiftCountryPicker", ofType: "bundle"),
            let bundle = Bundle(path: bundlePath),
            let jsonPath = bundle.path(forResource: "Data/countryCodes", ofType: "json") {
         
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) {
              
                do {
                    
                    if let jsonObjects = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? NSArray {
                        
                        for jsonObject in jsonObjects {
                            
                            guard let countryObj = jsonObject as? NSDictionary else {  return countries }
                            
                            guard let code = countryObj["code"] as? String, let phoneCode = countryObj["dial_code"] as? String, let name = countryObj["name"] as? String else {
                                return countries
                            }
                            
                            let country = Country(code: code, name: name, phoneCode: phoneCode)
                            countries.append(country)
                        }
                    }
                }
                catch {
                  print("Parsing country json failed.")
                }
                
            }
        } else {
            print("SwiftCountryPicker Bundle not able to locate.")
        }
        
        return countries
    }
  
}
