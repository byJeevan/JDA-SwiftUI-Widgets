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
                view: AnyView(BeforeAfterImageSliderDemoView())),
  
  WidgetOptions(id: 12,
                shortName: "Scrollable view with Sticky left side view",
                description: "A sticky left side view inside a scroll view - which can scroll until it reaches the top most edge of screen. Then it halts and remaining page contents can be scrollable till end. This is best suited iPad layout.",
                view: AnyView(ScrollableViewWithStickyLeftSideView())),
  
  WidgetOptions(id: 13,
                shortName: "Sliding tabs to switch pages",
                description: "Tabs on top of the page to switch the child pages by selecting tab item or simply sliding left/right to switch the child page.",
                view: AnyView(SlidingTabsDemoView())),
  
  WidgetOptions(id: 14,
                shortName: "Tinder like swipe view",
                description: "Stack of cards with a swipe-like feature similar to that of Tinder",
                view: AnyView(TinderSwipeView())),
  
  WidgetOptions(id: 15,
                shortName: "Tick mark animation",
                description: "A complex tick mark animation which is popular is world wide apps",
                view: AnyView(TickContentView())),
  
  WidgetOptions(id: 16,
                shortName: "Home layout",
                description: "A layout having all basic building blocks of a home page that we can see in common apps.",
                view: AnyView(HomeLayout())),

  WidgetOptions(id: 17,
                shortName: "Rich Text view",
                description: "Handles other than normal text like HTML, Markdown as given input.",
                view: AnyView(RichTextDemoView()))
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
