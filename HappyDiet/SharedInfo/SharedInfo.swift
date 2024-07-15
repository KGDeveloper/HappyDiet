//
//  UserInfo.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import Foundation
import SwiftData
import SwiftUI

/// 用户信息
class SharedInfo: ObservableObject {
    
    static var shared = SharedInfo()
    
    private init() {
        userInfo = UserInfo.prepareLoginUser().first
        appInfo = AppInfo(map: Bundle.main.infoDictionary ?? [:])
    }
    
    @Published var userInfo: UserInfo?
    @Published var rootType: RootType = .welcome
    @Published var appInfo: AppInfo
}


