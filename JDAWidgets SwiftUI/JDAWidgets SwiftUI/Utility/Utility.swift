//
//  Helper.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 26/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//

import Foundation

struct Utility {
    static func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}
