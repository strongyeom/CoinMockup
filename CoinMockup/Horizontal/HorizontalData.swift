//
//  HorizontalData.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import Foundation

struct HorizontalData: Identifiable {
    let id = UUID()
    let data: String
    let point: Int = Int.random(in: 100...5000)
}
