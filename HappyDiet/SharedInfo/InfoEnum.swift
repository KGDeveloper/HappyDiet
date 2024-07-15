//
//  InfoEnum.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/15.
//

import Foundation

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
