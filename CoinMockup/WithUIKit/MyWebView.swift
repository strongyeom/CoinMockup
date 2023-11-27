//
//  MyWebView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI
import WebKit
// SwiftUI 프로젝트에 UIKit 객체들을 활용하는 방법 => UIViewRepresentable

struct MyWebView: UIViewRepresentable {
    
    let url: String
    
    // UIViewType이 제네릭 구조(associatedtype)로 되어있기 때문에 WKWebView 로 반환하면서 사용 할 수 있음
    // 만들기 return 값에 명시적으로 만들고 싶은 것을 넣으면 된다.
    func makeUIView(context: Context) -> WKWebView {
        // WebView Load
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    // 업데이트 - (url 값을 바꿔서 다시 SwiftUI에 보여주겠다하면 작성하면 됨 )
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
