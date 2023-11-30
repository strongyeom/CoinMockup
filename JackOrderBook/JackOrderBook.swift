//
//  JackOrderBook.swift
//  JackOrderBook
//
//  Created by 염성필 on 2023/11/29.
//

import WidgetKit
import SwiftUI


// 디자인 한 위젯을 위젯으로 보여주기 
struct JackOrderBook: Widget {
    let kind: String = "JackOrderBook" // 위젯 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            JackOrderBookEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        //위젯의 사이즈를 몇개 까지 지원할 것인가
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct JackOrderBook_Previews: PreviewProvider {
    static var previews: some View {
        JackOrderBookEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
