//
//  Welcome.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import SwiftUI

struct Welcome: View {
    
    @EnvironmentObject var shareInfo: SharedInfo
    
    var body: some View {
        Text("欢迎👏🏻来到我的世界")
        
        Button("创建账号并登录") {
            UserInfo.insetData(info: UserInfo(name: "Mr.Qi",userMobile: "15201566683",userStatus: 1))
            shareInfo.type = 1
//            Scene().environmentObject(SharedInfo.shared)
        }
        
        Button("创建账号，但是不登录") {
            UserInfo.insetData(info: UserInfo(name: "MrQi",userMobile: "15201566684",userStatus: 0))
            shareInfo.type = 2
//            Scene().environmentObject(SharedInfo.shared)
        }
        
        Text("\(shareInfo.type)")
    }
}
