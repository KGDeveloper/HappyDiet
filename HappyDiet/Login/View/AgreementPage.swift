//
//  AgreementPage.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/16.
//

import SwiftUI
import WebKit

struct AgreementPage: View {
    
    @Binding var agreementType: AgreementType
    
    var body: some View {
        WebView(url: URL(string: "https://www.baidu.com"))
    }
}
