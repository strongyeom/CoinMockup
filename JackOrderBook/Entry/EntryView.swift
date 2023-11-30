//
//  EntryView.swift
//  JackOrderBookExtension
//
//  Created by 염성필 on 2023/11/30.
//
import SwiftUI // View 프로토콜을 사용하기 때문에 SwiftUI import 
import WidgetKit

// 위젯 뷰 디자인 - 위젯을 구성하는 View
struct JackOrderBookEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.test)
            Text(entry.date, style: .time)
            Text(UserDefaults.groupShared.string(forKey: "Market") ?? "잭코인")
//            Text(entry.token)
            Text(entry.price.formatted())
        }
      
    }
}
