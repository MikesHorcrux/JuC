//
//  view+Extention.swift
//  JuC
//
//  Created by Mike on 3/15/23.
//

import Foundation
import SwiftUI

extension View {
#if canImport(UIKit)
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    #endif
}
