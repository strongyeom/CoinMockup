//
//  OverlayView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/21.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.yellow)
                .frame(width: 150)
                
                Text("안녕하세요 안녕하세요 안녕하세요")
            }
            
            Circle()
                .fill(.green)
                .frame(width: 150)
                .overlay {
                    Text("여보세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요")
                }
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}
