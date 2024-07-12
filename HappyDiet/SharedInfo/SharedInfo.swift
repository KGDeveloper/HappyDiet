//
//  UserInfo.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import Foundation
import SwiftData
import SwiftUI

/// 权限处理协议
protocol AuthorityProtocol {
    /// 是否有权限访问
    var hasPermissions: Bool { get }
    /// 是否进行权限检测
    var isCheckPermissions: Bool { get }
    /// 添加权限控制检测
    func addPermissionsManage(page: any View, permissions: Identity)
    /// 移除权限控制检测
    func removePermissionsManage(page: any View, permissions: Identity)
}

protocol IdentityProtocol {
    /// 用户身份
    var identity: Identity { get }
}

/// App根视图场景
enum RootType {
    /// 欢迎页模块
    case welcome
    /// 登录模块
    case unLogic
    /// 已登录模块
    case login
}

/// 用户身份
enum Identity: Int {
    /// 游客
    case tourist = 1
    /// 常规注册用户
    case user   = 2
    ///  会员用户
    case member = 4
}

/// 用户信息
class SharedInfo: ObservableObject {
    
    static var shared = SharedInfo()
    
    private init() {}
    
    /// 视图场景
    @Published var rootType: RootType = .welcome
    
    @Published var userInfo: UserInfo?
    @Published var type: Int = 0
}


