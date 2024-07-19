//
//  LoginViewModel.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/16.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isAgree: Bool = false
    @Published var mobile: String = ""
    @Published var visableCode: String = ""
    @Published var isUserAgreement: Bool = false
    @Published var isPrivateAgreement: Bool = false
    
    /// 更新协议阅读状态
    func updateProtocolAgreeStatus() {
        isAgree.toggle()
    }
    
    /// 查看隐私协议
    func gotoPrivacyPage() {
        isUserAgreement.toggle()
    }
    
    /// 查看用户协议
    func gotoUserPage() {
        isPrivateAgreement.toggle()
    }
}
