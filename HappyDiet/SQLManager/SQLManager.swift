//
//  SQLManager.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import Foundation
import SQLite.Swift

let sqlFileName: String = "happy_diet.db"

public protocol TableProtocol {
    
    associatedtype DataModel
    func createTable()
    static func sqlDataToModel(sqlInfo: Row) -> DataModel
    static func insetData(info: DataModel) -> Int64
    static func update(id: Int64, info: DataModel?)
    static func delete(id: Int64)
}

public class SQLManager: NSObject {
    
    static let shared = SQLManager()
    
    var db: Connection?
    
    private override init() {
        super.init()
        
        objc_sync_enter(self)
        _openDataBase()
        objc_sync_exit(self)
    }
    
    private func _openDataBase() {
        guard var sqlPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first else {
            console(args: "初始化SQLite地址失败")
            return
        }
        
        sqlPath = "\(sqlPath)\(sqlFileName)"
        
        if !FileManager.default.fileExists(atPath: sqlPath) {
            console(args: FileManager.default.createFile(atPath: sqlPath, contents: nil, attributes: nil) ? "创建数据库成功" : "创建数据库失败",":",sqlPath)
        }
        
        guard let sqlDB = try? Connection(sqlPath) else {
            console(args: "数据库连接失败", ":", sqlPath)
            return
        }
        
        db = sqlDB
    }
}
