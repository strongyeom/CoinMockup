//
//  WalletView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct WalletView: View {
    
    
    @State private var isExpandable = false
    @State private var showDetail = false
    var walletList = wallets
    
    @State private var currentWallet: WalletModel = WalletModel(name: "", index: 0)
    
    // Namespace : 단순히 그룹을 만들어줌 ex) 여러개의 View를 하나로 구성될거야
    @Namespace var animation
    
    var body: some View {
        VStack {
            topTitle()
            cardSpace()
            Button("Animation On") {
                
                
                
                // State를 기준으로 데이터 변경함 <- State에 애니메이션 적용, State를 사용하는 모든 곳에서 애니메이션 적용됨...
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3)) { // 17.0 + <- .bouncy
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
        // 화면 전환 X overlay를 통해서 다른 화면을 씌어버림
        .overlay {
            if showDetail {
                    WalletDetailView(showDetail: $showDetail, currentWallet: currentWallet, animation: animation)
            }
        }
    }
    
    func cardSpace() -> some View {
        // 임의의 Rectangle을 만들고 opacity 0.01으로 사용자 이벤트 받을 수 있을때 애니메이션 적용
        ScrollView {
            ForEach(walletList, id: \.self) { item in
                cardView(item)
            }
        }
        .overlay {
            Rectangle()
                .fill(.black.opacity(isExpandable ? 0 : 0.01))
                .onTapGesture {
                    withAnimation {
                        isExpandable = true
                    }
                }
        }
       
    }
    
    func cardView(_ data: WalletModel) -> some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(data.color)
            .frame(height: 150)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .offset(y: CGFloat(data.index) * (isExpandable ? 0 : -130)) // true이면 0이 되니까 cardView에 offset 적용 안함
            .onTapGesture {
                withAnimation { // 17.0 + <- .bouncy
                    // 정보 업데이트 
                    currentWallet = data
                    // detailView로 넘겨주기
                    showDetail = true
                   
                }
            }
             
            .matchedGeometryEffect(id: data, in: animation)
        
    }
    
    func topTitle() -> some View {
        Text("Jack Wallet")
            .font(.largeTitle)
            .bold()
        
        // Bool 값에 따라 alignment leading, center 값 변경하기
            .frame(maxWidth: .infinity, alignment: isExpandable ? .leading : .center)
            .overlay(alignment: .trailing) {
                topOverlayBtn()
            }
            .padding()
    }
    
    func topOverlayBtn() -> some View {
        Button {
            withAnimation {
                isExpandable = false
            }
        } label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .padding()
                .background(.black, in: Circle()) // in : Circle 모양으로 잡아줄게
            //                .clipShape(Circle())
        }
        .opacity(isExpandable ? 1 : 0.0)
        // rotation
        .rotationEffect(Angle(degrees: isExpandable ? 225 : 45))
    }
}
struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
