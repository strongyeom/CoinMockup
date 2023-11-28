//
//  ExampleHorizontalView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/28.
//

import SwiftUI

struct ExampleHorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel(market: Market(market: "krw-btc", koreanName: "비트코인", englishName: "Bitcoin"))
    
    var body: some View {
        ScrollView {
            Text(viewModel.market.koreanName)
            GeometryReader { proxy in
                
                let graphWidth = proxy.size.width * 0.7
                
                VStack {
                    ForEach(viewModel.askOrderBook, id:\.id) { item in
                        HStack {
                            Text(item.price.formatted())
                                .frame(width: proxy.size.width * 0.2)
                                .background(.yellow)
                            ZStack(alignment: .leading) {
                                
                                let graphSize = CGFloat(item.size) / viewModel.largestAskSize() * graphWidth
                                
                                
                                Rectangle()
                                    .foregroundStyle(.blue.opacity(0.4))
                                    .frame(width: graphSize)
                                    .frame(maxWidth: graphWidth, alignment: .leading)
                                Text("\(item.size)")
                            }
                            .backgroundStyle(.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.timer()
        }
    }
}

struct ExampleHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleHorizontalView()
    }
}
