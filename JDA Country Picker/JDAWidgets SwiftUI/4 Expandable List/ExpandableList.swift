//
//  ExpandableList.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 15/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//

import Foundation
import SwiftUI

struct DataItems: Identifiable {
    let id = UUID()
    let title: String
    var innerDataItems: [DataItems]? // Inner Items
}

struct ExpandableList: View {
    var tutorialItems: [DataItems] = [
        DataItems(title: "Parent 1", innerDataItems: [ DataItems(title: "Child 1"), DataItems(title: "Child 2"), DataItems(title: "Child 3") ]),
        DataItems(title: "Parent 2", innerDataItems: [ DataItems(title: "Child 1") ]),
        DataItems(title: "Parent 3", innerDataItems: [ DataItems(title: "Child 1"), DataItems(title: "Child 2"), DataItems(title: "Child 3") ])
    ]
    
    var body: some View {
        List(tutorialItems, children: \.innerDataItems) { tutorial in
            Text(tutorial.title)
        }
    }
}
