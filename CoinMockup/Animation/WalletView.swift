//
//  WalletView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct WalletView: View {
    
    
    @State private var isExpandable = false
    
    
    
    var body: some View {
        VStack {
            topTitle()
            Spacer()
            
            Button("Animation On") {
                
                
                
                // State를 기준으로 데이터 변경함 <- State에 애니메이션 적용
                withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) { // 17.0 + <- .bouncy
                    isExpandable = true
                }
            }
            
            Button("Animation Off") {
                print("애니메이션 Off")
                withAnimation {
                    isExpandable = false
                }
            }
        }
    }
    
    func topTitle() -> some View {
        Text("Jack Wallet")
            .font(.largeTitle)
            .bold()
            .padding()
            // Bool 값에 따라 alignment leading, center 값 변경하기
            .frame(maxWidth: .infinity, alignment: isExpandable ? .leading : .center)
            .background(.red)
           
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
