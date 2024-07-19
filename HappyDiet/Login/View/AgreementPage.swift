//
//  AgreementPage.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/16.
//

import SwiftUI
import WebKit

struct AgreementPage: View {
    
    var isUserAgreement: Bool
    
    var body: some View {
        WebView(url: URL(string: isUserAgreement ? "https://www.baidu.com" : "https://www.kaifa.baidu.com"))
    }
}
