//
//  ExampleWalletDetailView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct ExampleWalletDetailView: View {
    
    @Binding var showDetail: Bool
    
    var detailData: WalletModel
    var animation: Namespace.ID
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.gray
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .fill(detailData.color)
                .frame(height: 150)
                .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                .overlay {
                    Text(detailData.name)
                        .font(.largeTitle)
                }
                .onTapGesture {
                    withAnimation {
                        showDetail = false
                    }
                    
                }
                .matchedGeometryEffect(id: detailData, in: animation)
                .padding()
        }
    }
}

//struct ExampleWalletDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExampleWalletDetailView(showDetail: .constant(false), detailData: WalletModel(name: "", index: 0), animation: Namespace.ID(id_t(0)))
//    }
//}
