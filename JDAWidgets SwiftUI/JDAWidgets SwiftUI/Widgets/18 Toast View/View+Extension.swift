//
//  View+Extension.swift
//  JDAWidgets SwiftUI
//
//  Created by Mac on 30/11/24.
//  Copyright © 2024 JDA. All rights reserved.
//

import SwiftUI

extension View {
  
  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}
