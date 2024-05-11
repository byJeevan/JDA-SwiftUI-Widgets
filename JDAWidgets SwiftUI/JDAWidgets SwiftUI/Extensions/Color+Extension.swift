//
//  Color+Extension.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 26/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
