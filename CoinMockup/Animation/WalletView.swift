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
    }
    
    func cardSpace() -> some View {
        ScrollView {
            ForEach(0..<5) { item in
                cardView(index: item)
                    .offset(y: 0) //0 , 100, 200, 300, 400
            }
        }
    }
    
    func cardView(index: Int) -> some View {
        
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.random())
            .frame(height: 150)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .offset(y: CGFloat(index) * (isExpandable ? 0 : -130)) // true이면 0이 되니까 cardView에 offset 적용 안함
        
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
