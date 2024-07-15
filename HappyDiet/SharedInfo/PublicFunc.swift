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

public func safeString(_ string: Any?) -> String {
    guard let string = string else { return "" }
    guard let string = string as? String else { return "\(string)" }
    return string
}

public func safeDate(_ date: Any?) -> Date {
    guard let date = date else { return Date.now }
    guard let date = date as? Date else { return Date.now }
    return date
}

public func safeInt(_ int: Any?) -> Int {
    guard let int = int else { return 0 }
    guard let int = int as? Int else { return 0 }
    return int
}
