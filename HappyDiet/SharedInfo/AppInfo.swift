//
//  AppInfo.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/15.
//

import Foundation

struct AppInfo {
    var appName: String // CFBundleDisplayName
    var version: String // CFBundleShortVersionString
    var build: String // CFBundleVersion
    var minOSVersion: String // MinimumOSVersion
    var bundleName: String // CFBundleName
    var identifier: String // CFBundleIdentifier
    var language: String // CFBundleDevelopmentRegion
    
    private init(appName: String, version: String, build: String, minOSVersion: String, bundleName: String, identifier: String, language: String) {
        self.appName = appName
        self.version = version
        self.build = build
        self.minOSVersion = minOSVersion
        self.bundleName = bundleName
        self.identifier = identifier
        self.language = language
    }
    
    init(map: [String : Any]) {
        self.init(appName: safeString(map["CFBundleDisplayName"]),
                  version: safeString(map["CFBundleShortVersionString"]),
                  build: safeString(map["CFBundleVersion"]),
                  minOSVersion: safeString(map["MinimumOSVersion"]),
                  bundleName: safeString(map["CFBundleName"]),
                  identifier: safeString(map["CFBundleIdentifier"]),
                  language: safeString(map["CFBundleDevelopmentRegion"]))
    }
}
