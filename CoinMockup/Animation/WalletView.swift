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
                
                isExpandable = true
            }
            
            Button("Animation Off") {
                print("애니메이션 Off")
                isExpandable = false
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
