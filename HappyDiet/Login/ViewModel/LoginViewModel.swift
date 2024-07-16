//
//  LoginViewModel.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/16.
//

import Foundation

enum AgreementType {
    case none
    case privacy
    case user
}

class LoginViewModel: ObservableObject {
    @Published var isAgree: Bool = false
    @Published var mobile: String = ""
    @Published var visableCode: String = ""
    @Published var agreementType: AgreementType = .none
    @Published var isUserAgreement: Bool = false
    
    /// 更新协议阅读状态
    func updateProtocolAgreeStatus() {
        isAgree.toggle()
    }
    
    /// 登录
    func loginAction() {
        
    }
    
    /// 查看隐私协议
    func gotoPrivacyPage() {
        agreementType = .privacy
        isUserAgreement = agreementType == .user
    }
    
    /// 查看用户协议
    func gotoUserPage() {
        agreementType = .user
    }
}
