//
//  HappyDietApp.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/11.
//

import SwiftUI

@main
struct HappyDietApp: App {
    
    var body: some Scene {
    
        WindowGroup {
            Windows().environmentObject(SharedInfo.shared)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        }
    }
}
