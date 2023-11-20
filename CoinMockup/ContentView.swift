//
//  ContentView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var banner: String = "23,322,222,123 원"
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView()
                    Text("Hello, world!")
                    LazyVStack {
                        ForEach(0..<50) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            .navigationTitle("My Wallet")
            // 당겨서 새로고침 iOS 15.0+
            .refreshable {
                banner = "\(Int.random(in: 50000...10000000).formatted())원"
            }
        }
        
       
    }
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                Text(banner)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    func listView(data: Int) -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("비트코인 \(data)")
                Text("Bitcoin \(data)")
            }
            Spacer()
            Text("KRW-BTC")
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
