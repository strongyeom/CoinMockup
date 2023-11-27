//
//  ExampleTextField.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

struct ExampleTextField : UIViewRepresentable {
 
    
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.tintColor = .red
        textField.placeholder = "UIKit -> SwiftUI 데이터 전달"
        textField.text = text
        // delegate self와 같은것 context가 UITextField
        textField.delegate = context.coordinator
        return textField
    }
    
    // 어떤 것을 업데이트 할 것인가
    func updateUIView(_ uiView: UITextField, context: Context) {
        // textField의 text를 변화시킬거야
        uiView.text = text
    }
    
    // TextField를 어떤 시점에서 실행시킬지 정해주는 단계 즉, textField의 여러시점 return, 커서 시작할때 ... 등등 있지만 이중에서 어떤 시점에서
    // 데이터를 넘겨줄것인지 정할 수 있음
    class Coordinator: NSObject, UITextFieldDelegate {
    
        // 사용자가에 입력받는 값 담아주는 변수
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Text를 치고 return을 눌렀을때 text에 담아줄거야
            text = textField.text ?? ""
            return true
        }
    }
    // 받은 데이터를 output으로 넘겨주자 즉, data를 $text에 담아서 넘겨주자
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
}
