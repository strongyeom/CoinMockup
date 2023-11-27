//
//  MyTextField.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

// SwiftUI -> UIKit

struct MyTextField : UIViewRepresentable {
   
    
    @Binding var uikitText: String
    
    // 변경되지 않는 디자인 같은 것들을 작성
    func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        view.borderStyle = .none
        view.keyboardType = .numberPad
        view.tintColor = .red
        view.font = .boldSystemFont(ofSize: 20)
        view.textAlignment = .center
        view.placeholder = "UIKit 텍스트 필드 입니다."
        view.text = uikitText
        view.delegate = context.coordinator
        return view
    }
    
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = uikitText
    }
    
    // UIKit -> SwiftUI?? 받을 데이터를 어떻게 output으로 만들어줄까?
    // UIKit의 기능을 SwiftUI로 꺼내줄때 사용
    // 어떤 타이밍에 어떤 데이터를 전달해줘야할지 알려주는것이  coordinate
    func makeCoordinator() -> Coordinator {
        return Coordinator(uikitText: $uikitText)
    }
    // ex) enter 누를때, 커서가 해제되었을때 ... 등등
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var uikitText: String
        
        init(uikitText: Binding<String>) {
            self._uikitText = uikitText // Binding<String> 타입을 String 타입으로 넣어주려면 _(언더바) 작성해야 오류 발생하지 않음
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            uikitText = textField.text ?? ""
            return true
        }
    }
}
