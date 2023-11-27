//
//  HorizontalView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel()
    
    var body: some View {
        ScrollView {
            Text("\(viewModel.value)")
            // 상위 뷰의(VStack) 사이즈에 비례해서 하위 뷰의 사이즈 비율로 설정할 수 있음
            GeometryReader { proxy in
                
                let grapWidth = proxy.size.width
                
                VStack {
                    ForEach(horizontalDummy, id: \.id) { item in
                        HStack(spacing: 10) {
                            Text(item.data)
                                .frame(width: proxy.size.width * 0.2)
                                .background(.green)
                            ZStack(alignment: .leading)  {
                                Rectangle()
                                    .foregroundStyle(.blue.opacity(0.4))
                                    // Rectangle에 대한 최대 길이에 대한 한번더 geometryReader를 활용하여 비율을 잡아야 넘어가지 않음 ... 🧐 어떻게 하면 좋을까??
                                    .frame(width: CGFloat(item.point) / 10)
                                    
                                Text(item.point.formatted())
                            }
                            .frame(maxWidth: grapWidth * 0.8, alignment: .leading)
                            .background(.gray)
                        }
                        .background(.yellow)
                        .frame(height: 40)
                    }
                }
                .padding()
                .onTapGesture {
                    viewModel.timer()
                    print(proxy)
                    print(largest())
                }
            }
        }
    }
}

struct HorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalView()
    }
}
