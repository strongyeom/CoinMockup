//
//  BannerView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/21.
//

import SwiftUI

struct BannerView: View {
    
    @StateObject var viewModel = BannerViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<5) { item in
                    ZStack {
                        Rectangle()
                            .fill(viewModel.banner.color)
                            .frame(height: 200)
                            .overlay {
                                Circle()
                                    .offset(x: -120, y: -20)
                                    .scale(1.3, anchor: .topLeading)
                                    .fill(.green.opacity(0.3))
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("나의 소비 내역")
                            Text(viewModel.banner.totalFormat)
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                    }
                    .padding()
//                    .onAppear {
//                        viewModel.fetchBanner()
//                }
                    .onTapGesture {
                        viewModel.fetchBanner()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
            }
            
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
