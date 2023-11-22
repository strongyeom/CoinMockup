//
//  WalletDetailView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct WalletDetailView: View {
    
    @Binding var showDetail: Bool // 화면 overlay false 하기
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.random())
                    .frame(height: 150)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .onTapGesture {
                    withAnimation {
                        showDetail = false
                    }
                }
                
                
                Text("Next View")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }

            
        }
       
    }
}


struct WalletDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WalletDetailView(showDetail: .constant(false))
    }
}
