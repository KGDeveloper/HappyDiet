//
//  WebView.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/16.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
