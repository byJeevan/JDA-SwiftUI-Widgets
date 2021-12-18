//
//  OptionsListView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 04/11/21.
//  Copyright © 2021 JDA. All rights reserved.
//

import SwiftUI

struct WidgetOptions: Identifiable {
    var id: Int
    let shortName: String
    let description: String
}

struct OptionsListView: View {
    
    var options: [WidgetOptions] = [
        WidgetOptions.init(id: 1, shortName: "Dropdown", description: "Simple dropdown shown when "),
        WidgetOptions.init(id: 2, shortName: "Country Picker", description: "Dropdown will be shown along with country flags. This is packed as bundle and works for offline usage."),
        WidgetOptions.init(id: 3, shortName: "Floating Button", description: "Floating Button which will reveal with more buttons when tapped.")
    ]
     
    @ViewBuilder func WidgetDetail(wOption: WidgetOptions) -> some View {
        switch wOption.id {
        case 1:
            Dropdown()
        case 2:
            CountryPicker() //FIXIT: Height of dropdown
        case 3:
            FloatingButton()
        default:
            Text("Widget Not implemented")
        }
    }
    
    var body: some View {
        
        NavigationView {
            List(options) { option in
                NavigationLink {
                    WidgetDetail(wOption: option)
                } label: {
                    WidgetRow(wOption: option)
                }
            }.navigationBarHidden(true)
        }
        
    }
}

struct WidgetRow: View {
    var wOption: WidgetOptions

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(wOption.id). " + wOption.shortName).bold()
            Text(wOption.description).font(.caption)
        }
    }
}

struct OptionsListView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsListView()
    }
}
