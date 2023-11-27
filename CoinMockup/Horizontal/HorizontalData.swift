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
    let point: Int = Int.random(in: 100...3000)
}

let horizontalDummy = [
    HorizontalData(data: "사과"),
    HorizontalData(data: "배"),
    HorizontalData(data: "자두"),
    HorizontalData(data: "수박"),
    HorizontalData(data: "참외"),
    HorizontalData(data: "멜론"),
    HorizontalData(data: "귤"),
    HorizontalData(data: "파인애플"),
    HorizontalData(data: "키위"),
    
]

// 숫자가 커지면 view를 넘어가지 않게 하기 위한 계산 메서드 
func largest() -> Int {
    let data = horizontalDummy.sorted(by: {$0.point > $1.point})
    return data.first!.point
}
