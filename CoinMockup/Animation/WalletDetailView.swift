//
//  WalletDetailView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct WalletDetailView: View {
    
    @Binding var showDetail: Bool // 화면 overlay false 하기
    let currentWallet: WalletModel // WalletView에서 선택한 card 정보
    
    // 동일한 그룹임을 인식하기 위해서 변수 설정
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(currentWallet.color)
                    .frame(height: 150)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .onTapGesture {
                    withAnimation {
                        showDetail = false
                    }
                }
                .matchedGeometryEffect(id: currentWallet, in: animation)
                
                
                Text(currentWallet.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }

            
        }
       
    }
}


//struct WalletDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WalletDetailView(showDetail: .constant(false), currentWallet: WalletModel(name: "", index: 0), animation: Namespace.ID.self)
//    }
//}
