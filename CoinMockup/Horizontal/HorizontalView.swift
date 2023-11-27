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
                        HStack {
                            Text(item.data)
                                .frame(width: grapWidth * 0.3)
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.blue.opacity(0.4))
                                    .frame(width: CGFloat(item.point) / 10)
                                    .frame(maxWidth: grapWidth * 0.7 / 10)
                                Text(item.point.formatted())
                            }
                           
                            .frame(maxWidth: .infinity)
                            .background(.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .padding()
                .onTapGesture {
                    viewModel.timer()
                    print(proxy)
                    print(largest())
                }
            .background(.green)
            }
        }
    }
}

struct HorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalView()
    }
}
