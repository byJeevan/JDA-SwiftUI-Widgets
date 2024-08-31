//
//  OptionsListView.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 04/11/21.
//  Copyright © 2021 JDA. All rights reserved.
//

import SwiftUI


let options: [WidgetOptions] = [
  
  WidgetOptions(id: 1,
                shortName: "Dropdown",
                description: "Simple dropdown shown and when selected value will be filled.",
                view: AnyView(Dropdown())),
  
  WidgetOptions(id: 2,
                shortName: "Country Picker",
                description: "Dropdown will be shown along with country flags (offline). This is packed as bundle and works for offline usage.",
                view: AnyView(CountryPicker())),
  
  WidgetOptions(id: 3,
                shortName: "Floating Button",
                description: "Floating Button which will reveal more buttons when tapped.",
                view: AnyView(FloatingButton())),
  
  WidgetOptions(id: 4,
                shortName: "Expandable (Accordion) List",
                description: "List that can expand or collapse.",
                view: AnyView(ExpandableList())),
  
  WidgetOptions(id: 5,
                shortName: "Basic Activity Indicator",
                description: "Simplest activity indicator for SwiftUI.",
                view: AnyView(BasicActivityIndicator(animationSwitch: true))),
  
  WidgetOptions(id: 6,
                shortName: "Endless List (Lazy loading)",
                description: "List that scrolls infinitely and fetches new content whenever a user reaches the end of the list.",
                view: AnyView(EndlessList())),
  
  WidgetOptions(id: 7,
                shortName: "Custom Dialog Example",
                description: "Bake a custom dialog view and toggle visibility with animation from the center.",
                view: AnyView(CustomDialogExampleView())),
  
  WidgetOptions(id: 8,
                shortName: "Star Rating",
                description: "Star rating widget for all needs.",
                view: AnyView(StarRatingDemoView())),
  
  WidgetOptions(id: 9,
                shortName: "Tags",
                description: "Group of Tags takes action and alignment can be controlled to Left/Center/Right.",
                view: AnyView(TagsDemoView())),
  
  WidgetOptions(id: 10,
                shortName: "Bottom To Top sheet",
                description: "Simple bottom to top sheet appears with animation.",
                view: AnyView(BottomToTopSheetView())),
  
  WidgetOptions(id: 11,
                shortName: "Before After image slider",
                description: "Drag the slider to reveal the 'After' image overlapped with 'Before' image.",
                view: AnyView(BeforeAfterImageSliderDemoView()))
]


// MARK: - Options Model
struct WidgetOptions: Identifiable {
  var id: Int
  let shortName: String
  let description: String
  let view: AnyView
}

// MARK: - Widget Option List view
struct OptionsListView: View {
  var body: some View {
    NavigationView {
      List(options) { option in
        NavigationLink(destination: option.view) {
          WidgetRow(wOption: option)
        }
      }
      .navigationBarHidden(true)
    }
  }
}

// MARK: - Widget Option Row
struct WidgetRow: View {
  var wOption: WidgetOptions
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("\(wOption.id). " + wOption.shortName).bold()
      Text(wOption.description).font(.caption)
    }
  }
}

// MARK: - Preview
struct OptionsListView_Previews: PreviewProvider {
  static var previews: some View {
    OptionsListView()
  }
}
