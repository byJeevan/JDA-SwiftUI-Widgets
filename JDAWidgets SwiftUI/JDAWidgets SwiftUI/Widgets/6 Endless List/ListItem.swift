//
//  ListItem.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 26/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//

import Foundation
import SwiftUI

struct ListItem {
    var id: String = "\(Utility.randomInt(min: 1, max: 10000))"
    var color = Color.random.opacity(0.4)
}
