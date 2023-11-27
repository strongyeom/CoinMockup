//
//  SeSacView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI
/*
 UIKit과 SwiftUI를 같이 사용할때는 언제가 있을까?
 => SwiftUI에서 구현하지 못하는 것이 있을때 UIKit 결합해서 사용
 ex) WKWebView(2차 리캡때 사용) or WebLink
 */

struct SeSacView: View {
    @State private var text = "SwiftUI 텍스트"
    @State private var uiKitText = "UIKit 텍스트"
    var body: some View {
        VStack {
            Text("텍스트 필드에서 작성하는 : \(text)")
            TextField("SwiftUI 텍스트 필드입니다.", text: $text)
            
            VStack {
                Text("UIKit에서 작성한 텍스트 필드 - SwiftUI로 : \(uiKitText)")
                MyTextField(uikitText: $uiKitText)
            }
            .background(.gray)
            .padding()
            
            MyWebView(url: "https://www.naver.com")
        }
    }
}

struct SeSacView_Previews: PreviewProvider {
    static var previews: some View {
        SeSacView()
    }
}
