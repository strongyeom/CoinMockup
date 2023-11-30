//
//  SimpleEntry.swift
//  JackOrderBookExtension
//
//  Created by 염성필 on 2023/11/30.
//

import WidgetKit

// 위젯을 구성하는데 필요한 Data , 즉 모델
struct SimpleEntry: TimelineEntry {
    let date: Date // 어떤 시점에 랜더링되는 시점을 알기 위해 TimelineEntry 채택하면 default임
    let test: String
    let token: String
    let price: Int
}
