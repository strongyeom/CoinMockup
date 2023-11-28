//
//  OrderBookModel.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/28.
//

import Foundation

struct OrderBookModel: Decodable {
    let market: String
    let timestamp: Int
    let total_ask_size, total_bid_size: Double
    let orderbook_units: [OrderBookUnit]
}

struct OrderBookUnit: Decodable {
    let ask_price, bid_price: Double
    let ask_size, bid_size: Double
}

// View에서 사용하기 위해 가공하려고 하는 모델
struct OrderBookItem: Hashable, Identifiable {
    let id = UUID()
    let price: Double
    let size: Double
}
