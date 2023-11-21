//
//  ListView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/21.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel = ListViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.market, id: \.id) { data in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(data.koreanName)
                                .fontWeight(.bold)
                            Text(data.englishName)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(data.market)
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.fetchAllMarket()
        }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
