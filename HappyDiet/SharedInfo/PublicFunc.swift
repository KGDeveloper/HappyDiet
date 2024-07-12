//
//  PublicFunc.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import Foundation

public func console(args: Any...) {
    debugPrint(">>>>>>>>>>>>>>>\(args)")
}

public func safeString(_ string: String?) -> String {
    return string ?? ""
}

public func safeDate(_ date: Date?) -> Date {
    return date ?? Date.now
}

public func safeInt(_ int: Int?) -> Int {
    return int ?? 0
}
