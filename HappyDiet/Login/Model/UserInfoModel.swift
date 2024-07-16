//
//  UserInfoModel.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import Foundation
import SQLite.Swift

fileprivate let _UserInfoModel = Table("user_info")

fileprivate let user_id = Expression<Int64>("id")
fileprivate let user_name = Expression<String?>("name")
fileprivate let user_mobile = Expression<String?>("mobile")
fileprivate let user_create_time = Expression<Date>("createTime")
fileprivate let user_birthday = Expression<Date>("birthday")
fileprivate let user_sex = Expression<Int?>("sex")
fileprivate let user_headImg = Expression<String?>("headImg")
fileprivate let user_email = Expression<String?>("email")
fileprivate let user_status = Expression<Int?>("status")
fileprivate let user_identity = Expression<Int?>("identity")

struct UserInfo {
    
    var userId: Int64?
    var userName: String?
    var userMobile: String?
    var userCreateTime: Date?
    var userBirthday: Date?
    var userSex: Int?
    var userHeadImg: String?
    var userEmail: String?
    var userStatus: Int?
    var userIdentity: Int?
    
    init(name: String? = nil,
         userMobile: String? = nil,
         userCreateTime: Date? = nil,
         userBirthday: Date? = nil,
         userSex: Int? = nil,
         userHeadImg: String? = nil,
         userEmail: String? = nil,
         userStatus: Int? = nil,
         userIdentity: Int? = nil
    ) {
        self.userName = name
        self.userMobile = userMobile
        self.userCreateTime = userCreateTime
        self.userBirthday = userBirthday
        self.userSex = userSex
        self.userHeadImg = userHeadImg
        self.userEmail = userEmail
        self.userStatus = userStatus
        self.userIdentity = userIdentity
        createTable()
    }
}

extension UserInfo {
    static func prepare(mobile: String) -> [UserInfo] {
        let res = try? SQLManager.shared.db?.pluck(_UserInfoModel.filter(user_mobile == mobile))
        if res != nil {
            return [sqlDataToModel(sqlInfo: res!)]
        }
        return []
    }
    
    static func prepare(userId: Int64) -> [UserInfo] {
        let res = try? SQLManager.shared.db?.pluck(_UserInfoModel.filter(user_id == userId))
        if res != nil {
            return [sqlDataToModel(sqlInfo: res!)]
        }
        return []
    }
    
    static func prepareLoginUser() -> [UserInfo] {
        let res = try? SQLManager.shared.db?.pluck(_UserInfoModel.filter(user_status == 1))
        if res != nil {
            return [sqlDataToModel(sqlInfo: res!)]
        }
        return []
    }
}

extension UserInfo: TableProtocol {
    func createTable() {
        let create = _UserInfoModel.create(ifNotExists: true) { (build) in
            build.column(user_id, primaryKey: .autoincrement)
            build.column(user_name)
            build.column(user_mobile)
            build.column(user_create_time)
            build.column(user_birthday)
            build.column(user_sex)
            build.column(user_headImg)
            build.column(user_email)
            build.column(user_status)
            build.column(user_identity)
        }
        _ = try? SQLManager.shared.db?.run(create)
    }
    
    static func sqlDataToModel(sqlInfo: SQLite.Row) -> UserInfo {
        
        var userInfo = UserInfo()
        userInfo.userId = sqlInfo[user_id]
        userInfo.userName = sqlInfo[user_name]
        userInfo.userMobile = sqlInfo[user_mobile]
        userInfo.userCreateTime = sqlInfo[user_create_time]
        userInfo.userBirthday = sqlInfo[user_birthday]
        userInfo.userSex = sqlInfo[user_sex]
        userInfo.userHeadImg = sqlInfo[user_headImg]
        userInfo.userEmail = sqlInfo[user_email]
        userInfo.userStatus = sqlInfo[user_status]
        userInfo.userIdentity = sqlInfo[user_identity]
        
        return userInfo
    }
    
    static func insetData(info: UserInfo) -> Int64 {
        let insert = _UserInfoModel.insert(user_name <- info.userName,
                                           user_mobile <- info.userMobile,
                                           user_create_time <- safeDate(info.userCreateTime),
                                           user_birthday <- safeDate(info.userBirthday),
                                           user_sex <- info.userSex,
                                           user_headImg <- info.userHeadImg,
                                           user_email <- info.userEmail,
                                           user_status <- info.userStatus,
                                           user_identity <- info.userIdentity)
        
        
        guard let rowId = try? SQLManager.shared.db?.run(insert) else {
            return -1
        }
        return rowId
    }
    
    static func update(id: Int64, info: UserInfo?) {
        guard let info = info else { return }
        let oldInfo = _UserInfoModel.filter(user_id == id)
        let result = try? SQLManager.shared.db?.run(oldInfo.update(user_name <- info.userName,
                                                                   user_mobile <- info.userMobile,
                                                                   user_create_time <- safeDate(info.userCreateTime),
                                                                   user_birthday <- safeDate(info.userBirthday),
                                                                   user_sex <- info.userSex,
                                                                   user_headImg <- info.userHeadImg,
                                                                   user_email <- info.userEmail,
                                                                   user_status <- info.userStatus,
                                                                   user_identity <- info.userIdentity))
        console(args: result != nil ? "更新成功" : "更新失败")
    }
    
    static func delete(id: Int64) {
        let oldInfo = _UserInfoModel.filter(user_id == id)
        let result = try? SQLManager.shared.db?.run(oldInfo.delete())
        console(args: result != nil ? "删除成功" : "删除失败")
    }
    
    typealias DataModel = UserInfo
}
