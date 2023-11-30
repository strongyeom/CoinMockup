//
//  WidgetTabView.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/30.
//

// 위젯에 버튼을 달아 DeepLink활용하기
import SwiftUI

struct WidgetTabView: View {
    @State private var selectedTap: String = "book"
    var body: some View {
        TabView(selection: $selectedTap) {
            Button("1111") {
                selectedTap = "pencil"
            }
            .tabItem {
                Label("book", systemImage: "book")
            }
            .tag("book")
            
            Text("2")
                .tabItem {
                    Label("star", systemImage: "star")
                }
                .tag("star")
            Text("3")
                .tabItem {
                    Label("pencil", systemImage: "pencil")
                }
                .tag("pencil")
        }
        //
        .onOpenURL {
            
            switch $0.absoluteString {
            case "History":
                selectedTap = "book"
            case "Favotite":
                selectedTap = "star"
            default:
                selectedTap = "pencil"
            }
        }
    }
}

struct WidgetTabView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetTabView()
    }
}
