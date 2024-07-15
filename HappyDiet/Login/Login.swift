//
//  Login.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import SwiftUI

struct Login: View {
    
    @State private var mobile: String = ""
    @State private var visableCode: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            /// 固定App名称
            Text("快乐美食")
                .fontWeight(.medium)
                .font(.system(size: 24))
                .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                .frame(maxWidth: .infinity,minHeight: 240, maxHeight: 240,alignment: .leading)
                .background(LinearGradient(colors: [.accentColor,.white], startPoint: .top, endPoint: .bottom))
            /// 用户手机号
            TextField(text: $mobile) {
                Text("手机号").foregroundStyle(Color.init(hex: 0xff989FA8)).font(.system(size: 14)).fontWeight(.medium)
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)).frame(height: 50)
                .background(Color.init(hex: 0xffF1F2F6))
                .clipShape(.rect(cornerRadius: 8),style: .init())
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            /// 用户密码
            TextField(text: $visableCode) {
                Text("验证码").foregroundStyle(Color.init(hex: 0xff989FA8)).font(.system(size: 14)).fontWeight(.medium)
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)).frame(height: 50)
                .background(Color.init(hex: 0xffF1F2F6))
                .clipShape(.rect(cornerRadius: 8),style: .init())
                .padding(EdgeInsets(top: 15, leading: 30, bottom: 0, trailing: 30))

            
            Spacer()
        }
    }
}

#Preview {
    Login()
}
