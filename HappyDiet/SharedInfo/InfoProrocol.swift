//
//  InfoProrocol.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/15.
//

import Foundation
import SQLite
import SwiftUI

///// 权限处理协议
//protocol AuthorityProtocol {
//    /// 是否有权限访问
//    var hasPermissions: Bool { get }
//    /// 是否进行权限检测
//    var isCheckPermissions: Bool { get }
//    /// 添加权限控制检测
//    func addPermissionsManage(page: any View, permissions: Identity)
//    /// 移除权限控制检测
//    func removePermissionsManage(page: any View, permissions: Identity)
//}

protocol IdentityProtocol {
    /// 用户身份
    var identity: Identity { get }
}
