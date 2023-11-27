//
//  ExampleSeSacView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

struct ExampleSeSacView: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            Text("변화를 보자 : \(text)")
            ExampleTextField(text: $text)
            ExampleViewWebView(url: "https://www.naver.com")
        }
    }
}

struct ExampleSeSacView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleSeSacView()
    }
}
