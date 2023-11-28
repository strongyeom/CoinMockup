//
//  HorizontalView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel(market: Market(market: "krw-btc", koreanName: "", englishName: ""))
    
    var body: some View {
        ScrollView {
            Text(viewModel.market.koreanName)
            // 상위 뷰의(VStack) 사이즈에 비례해서 하위 뷰의 사이즈 비율로 설정할 수 있음
            GeometryReader { proxy in
                
                let grapWidth = proxy.size.width * 0.7// 챠트 최대 너비
                
                VStack {
                    ForEach(viewModel.askOrderBook, id: \.id) { item in
                        HStack(spacing: 10) {
                            Text("\(item.price)")
                                .frame(width: proxy.size.width * 0.3)
                                .background(.green)
                            ZStack(alignment: .leading)  {
                                // 각각의  dummyData가 가져야하는 데이터
                                let graphSize = CGFloat(item.size) / CGFloat(viewModel.largestAskSize()) * grapWidth
                                Rectangle()
                                    .foregroundStyle(.blue.opacity(0.4))
                                    // Rectangle에 대한 최대 길이에 대한 한번더 geometryReader를 활용하여 비율을 잡아야 넘어가지 않음 ... 🧐 어떻게 하면 좋을까??
                                    // => 현재 ponit / 최대 값 point * VStack의 가로 길이
                                    .frame(width: CGFloat(graphSize))
                                    .frame(maxWidth: grapWidth, alignment: .leading)
                                
                                Text("\(item.size)")
                                    .frame(width: grapWidth)
                            }
                           
                            .background(.gray)
                        }
                        .background(.yellow)
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

struct HorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalView()
    }
}
