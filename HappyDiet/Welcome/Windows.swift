//
//  Windows.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import SwiftUI

struct Windows: View {
    
    @StateObject var shareInfo: SharedInfo = SharedInfo.shared
    
    var body: some View {
        if (shareInfo.rootType == .unLogic) {
            Login().frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        } else if (shareInfo.rootType == .login) {
            TabController().frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        } else {
            Welcome(rootType: $shareInfo.rootType)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .background(LinearGradient(colors: [.white, .init(hex: 0xEEE6D9),.init(hex: 0xEEC8A4)], startPoint: .top, endPoint: .bottom))
        }
    }
}
