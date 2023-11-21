//
//  ContentView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    
    // ObservedObject : 부모뷰 ( 상위 뷰 ) 에 있는 데이터가 변경되었을때 랜더링 -> 하위뷰가 ObservedObject일 경우 하위 뷰도 싹다 랜더링 됨
    
    // ⭐️ StateObject : 상위뷰가 랜더링 되더라도 데이터가 유지 됨
   @ObservedObject var viewModel = ContentViewModel()
   
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<4) { item in
                                bannerView()
                                    .onTapGesture {
                                        viewModel.fetchBanner()
                                    }
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
                    ListView()
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("My Wallet")
            // 당겨서 새로고침 iOS 15.0+
            .refreshable {
                viewModel.fetchBanner()
            }
        }
        
       
    }
    
   
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(viewModel.banner.color)
                .overlay(content: {
                    Circle()
                        .fill(.yellow.opacity(0.4))
                        .offset(x: -100, y: -20)
                        .scaleEffect(1.3, anchor: .topLeading)
                        
                })
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(height: 200)
            // 애니메이션 적용 레이블과 ZStack 따로
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.title3)
                Text(viewModel.banner.totalFormat)
            }
            .font(.title)
            .foregroundColor(.white)
            
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
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
