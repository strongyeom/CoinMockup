//
//  ExampleViewWebView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI
import WebKit

struct ExampleViewWebView : UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else { return WKWebView() }
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
