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
        WidgetOptions(id: 1, shortName: "Dropdown", description: "Simple dropdown shown when tap event."),
        WidgetOptions(id: 2, shortName: "Country Picker", description: "Dropdown will be shown along with country flags (offline). This is packed as bundle and works for offline usage."),
        WidgetOptions(id: 3, shortName: "Floating Button", description: "Floating Button which will reveal with more buttons when tapped."),
        WidgetOptions(id: 4, shortName: "Expandable (Accordion) List", description: "List that can expand or collapse."),
        WidgetOptions(id: 5, shortName: "Basic Activity Indicator", description: "Simplest activity indicator for SwiftUI."),
        WidgetOptions(id: 6, shortName: "Endless List (Lazy loading)", description: "List that scrolls infinitely and fetches new content whenever a user reaches the end of the list")

    ]
     
    @ViewBuilder func WidgetDetail(wOption: WidgetOptions) -> some View {
        switch wOption.id {
        case 1:
            Dropdown()
        case 2:
            CountryPicker() //FIXIT: Height of dropdown
        case 3:
            FloatingButton()
        case 4:
            ExpandableList()
        case 5:
            BasicActivityIndicator(animationSwitch: true)
        case 6:
            EndlessList()
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
