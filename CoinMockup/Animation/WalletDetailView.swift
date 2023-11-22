//
//  WalletDetailView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//

import SwiftUI

struct WalletDetailView: View {
    var body: some View {
        ZStack {
            Color.gray
            Text("Next View")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
    }
}

struct WalletDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WalletDetailView()
    }
}
