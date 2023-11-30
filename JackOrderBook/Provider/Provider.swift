//
//  Provider.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/30.
//

import WidgetKit

// 위젯을 미리 그려주는 정책을 관리
struct Provider: TimelineProvider {
    // 위젯킷이 최초로 랜더링 될때 사용 -> 스켈레톤 뷰로 랜더링
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), test: "패션후르츠", token: "토큰", price: 10000000000)
    }
    // 위젯을 추가 하기전에 미리보기 화면 구성
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), test: "용과", token: "비트코인", price: 543210000)
        completion(entry)
    }
    // 위젯 상태에 대한 어떤 시점에 계속해서 위젯을 갱신해줄지 설정 해주는 타이밍 즉, 갱신 주기
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute,
                                                  value: hourOffset,
                                                  to: currentDate)!
            let entry = SimpleEntry(date: Date(), test: "두리안", token: "냄새나", price: Int.random(in: 100...1000000000))
            entries.append(entry)
        }
        // 타임라인 마지막 날짜가 지난 뒤, 위젯키이 새로운 타임라인을  요청 할 수 있도록 설정 ( .atEnd )
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
