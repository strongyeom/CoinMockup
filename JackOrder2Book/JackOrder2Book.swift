//
//  JackOrder2Book.swift
//  JackOrder2Book
//
//  Created by 염성필 on 2023/11/30.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct JackOrder2BookEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text("방금 추가한 위젯")
            
            HStack {
                Link(destination: URL(string: "History")!) {
                    Image(systemName: "book")
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.3))
                        .clipShape(Circle())
                }
                
                Link(destination: URL(string: "Favorite")!) {
                    Image(systemName: "star")
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.3))
                        .clipShape(Circle())
                }
            }
           
        }
       
    }
}

struct JackOrder2Book: Widget {
    let kind: String = "JackOrder2Book"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            JackOrder2BookEntryView(entry: entry)
        }
        .configurationDisplayName("위젯 링크 데스트")
        .description("내가 위젯이다.")
    }
}

struct JackOrder2Book_Previews: PreviewProvider {
    static var previews: some View {
        JackOrder2BookEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
