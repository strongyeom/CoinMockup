//
//  JackOrderBook.swift
//  JackOrderBook
//
//  Created by 염성필 on 2023/11/29.
//

import WidgetKit
import SwiftUI

// 위젯을 미리 그려주는 정책을 관리
struct Provider: TimelineProvider {
    // 위젯킷이 최초로 랜더링 될때 사용 -> 스켈레톤 뷰로 랜더링
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    // 위젯을 추가 하기전에 미리보기 화면 구성
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    // 위젯 상태에 대한 어떤 시점에 계속해서 위젯을 갱신해줄지 설정 해주는 타이밍 즉, 갱신 주기
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        // 타임라인 마지막 날짜가 지난 뒤, 위젯키이 새로운 타임라인을  요청 할 수 있도록 설정 ( .atEnd )
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// 위젯을 구성하는데 필요한 Data
struct SimpleEntry: TimelineEntry {
    let date: Date
}

// 위젯 뷰 디자인 - 위젯을 구성하는 View
struct JackOrderBookEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

// 디자인 한 위젯을 해당 위젯에 보여주기
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
