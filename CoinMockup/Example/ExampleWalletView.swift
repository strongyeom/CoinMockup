//
//  ExampleWalletView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct ExampleWalletView: View {
    
  /*
   
   @State private var isExpandable = false
   @State private var showDetail = false
   var walletList = wallets
   
   */
    
    @State private var isExpandable = false
    @State private var showDetail = false
    var walletList = wallets
    @State private var detailData: WalletModel = WalletModel(name: "", index: 0)
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            topTitle()
            Spacer()
            cardSpace()
        }
        .padding()
        .overlay {
            if showDetail {
                ExampleWalletDetailView(showDetail: $showDetail, detailData: detailData, animation: animation)
            }
        }
    }
    
    func topTitle() -> some View {
        Text("My Wallet Title")
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: isExpandable ? .leading : .center)
            .overlay(alignment: .trailing) {
                topOverlayBtn()
            }
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
                .background(.black, in: Circle())
                .opacity(isExpandable ? 1.0 : 0.0) // opacity 0.0이 되면 클릭 안되는 특성 사용
                .rotationEffect(Angle(degrees: isExpandable ? 225 : 45))
        }
    }
    
    func cardSpace() -> some View {
        ScrollView {
           cardView()
        }
        .overlay {
            Rectangle()
                .opacity(isExpandable ? 0.0 : 0.01)
                .onTapGesture {
                    withAnimation {
                        isExpandable = true
                    }
                }
        }
    }
    
    func cardView() -> some View {
        ForEach(walletList, id: \.self) { item in
            RoundedRectangle(cornerRadius: 25)
                .fill(item.color)
                .frame(height: 150)
                .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                .offset(y: isExpandable ? 0 : CGFloat(item.index) * -130)
                .onTapGesture {
                    withAnimation {
                        showDetail = true
                        detailData = item
                    }
                }
                .matchedGeometryEffect(id: item, in: animation)
        }
    }
}

struct ExampleWalletView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleWalletView()
    }
}
