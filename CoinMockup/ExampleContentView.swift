//
//  ExampleContentView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/20.
//

import SwiftUI

struct ExampleContentView: View {
    @State private var banner: Banner = Banner()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView(banner: banner)
//                    aaView(banner: banner)
                    Text("Hello world")
                    LazyVStack {
                        ForEach(dummy, id: \.id) { item in
                            listView(data : item)
                        }
                    }
                }
            }
            .navigationTitle("My Wallet")
            .refreshable {
                banner = Banner()
                dummy.shuffle()
            }
        }
    }
    
    func bannerView(banner: Banner) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                Text(banner.totalFormat)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
//            .frame(width: .infinity, alignment: .leading)
        }
        .padding()
    }
    
//    func aaView(banner: Banner) -> some View {
//        RoundedRectangle(cornerRadius: 20)
//            .fill(.green)
//            .frame(height: 200)
//            .overlay {
//                VStack(alignment: .leading) {
//                    Spacer()
//                    Text("나의 소비내역")
//                    Text(banner.totalFormat)
//                }
//                .background(.red)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
//            }
//    }
    
    func listView(data: Money) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.product)
                Text(data.category.rawValue)
            }
            Spacer()
            Text("\(data.amount)원")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

struct ExampleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleContentView()
    }
}
