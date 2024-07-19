//
//  Extension.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/15.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let intr = Double((hex >> 16) & 0xFF)/255.0
        let intg = Double((hex >> 8) & 0xFF)/255.0
        let intb = Double(hex & 0xFF)/255.0
        
        self.init(red: intr, green: intg, blue: intb, opacity: opacity)
    }
}

extension String {
    
    var isValidChinesePhoneNumber: Bool {
        let pattern = "^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }
}
