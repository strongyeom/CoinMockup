//
//  ContentView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var banner: String = "23,322,222,123 원"
    @State private var money: [Money] = []
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<4) { item in
                                bannerView()
                                    .frame(width: UIScreen.main.bounds.width)
                                // 화면에 꽉 채우기
//                                    .containerRelativeFrame(.horizontal) 17.0+
                            }
                        }
                        
                        
                        // 17.0 + <- Paging 기능 추가
                        //.scrollTargetLayout() <- 스크롤 하고자 하는 대상에 대한 레이아웃 설정
                        
                        // viewaligned : View를 중앙으로 맞춰줌
                        //.scrollTargetBehavior(.viewaligned)
                        
                        // 17.0 + <- 양옆의 이미지가 살짝 보이게 하는 방법
                        // safeAreaPadding([.horizontal], 40)
                    }

                    Text("Hello, world!")
                    LazyVStack {
                        ForEach(money, id: \.id) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("My Wallet")
            // 당겨서 새로고침 iOS 15.0+
            .refreshable {
                banner = "\(Int.random(in: 50000...10000000).formatted())원"
                money = dummy.shuffled()
            }
            // 빌드 되자마자 보여짐 == viewWillAppear와 동일
            .onAppear {
                money = dummy.shuffled()
            }
        }
        
       
    }
    
   
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
                .frame(height: 200)
            // 애니메이션 적용 레이블과 ZStack 따로
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                Text(banner)
            }
            
            // 17.0 +
//            .visualEffect { content, geometryProxy in
//                content.offset(x: scrollOfset(geometryProxy)
//            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    // GeometryProxy : 컨테이너 뷰에 대한 좌표나 크기에 접근 할 수 있음
//    func scrollOfset(_ proxy: GeometryProxy) -> CGFloat {
//        let result = proxy.bounds(of: .scrollView)?.minX ?? 0
//        return result
//    }
    
    func listView(data: Money) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("비트코인 \(data.product)")
                Text("Bitcoin \(data.category.rawValue)")
            }
            Spacer()
            Text(data.amountFormat)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
