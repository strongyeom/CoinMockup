//
//  HorizontalViewModel.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

class HorizontalViewModel: ObservableObject {
    
   
    
    // @State의 범주는 View로 한정되어 있음 => ViewModel을 쓰는 이유 View에 @State가 너무 많으면 가독성 떨어짐 
    @Published var value = 0.0
    @Published var dummyData: [HorizontalData] = []
    
    @Published var askOrderBook: [OrderBookItem] = []
    @Published var bidOrderBook: [OrderBookItem] = []
    
    // ListView에서 갖고있는 market 데이터를 넘겨받기위한 변수설정
    var market: Market
    
    init(market: Market) {
        self.market = market
    }
    
    func fetchOrderBook() {
        let url = URL(string: "https://api.upbit.com/v1/orderbook?markets=\(market.market)")!
        
        // 테스트 용이기 때문에 data만 받음
        URLSession.shared.dataTask(with: url) { data, response, error in
            
//            print(data, response, error)
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([OrderBookModel].self, from: data)
//                print(decodedData)
                print("decodedData - \(decodedData)")
                DispatchQueue.main.async {
                    // 서버에서 들어오는 데이터 가공해서 담기
                   
                    let result = decodedData.first?.orderbook_units ?? [OrderBookUnit(ask_price: 0, bid_price: 0, ask_size: 0, bid_size: 0)]
                    
                    let ask = result.map { OrderBookItem(price: $0.ask_price, size: $0.ask_size)}
                        .sorted(by: { $0.price > $1.price })
                    
                    let bid = result.map { OrderBookItem(price: $0.bid_price, size: $0.bid_size)}
                        .sorted(by: { $0.price > $1.price})
                    
                    self.askOrderBook = ask
                    self.bidOrderBook = bid
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func largestAskSize() -> Double {
        return askOrderBook.sorted(by: { $0.size > $1.size}).first!.size
        
    }
    
    func largestBidSize() -> Double {
        return bidOrderBook.sorted(by: { $0.size > $1.size}).first!.size
        
    }
    
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.value += 1
            // 타이머가 동작할때마다 데이터(DummyData)가 달라지게끔 구성
            self.fetchOrderBook()
        }
    }
    
    func fetchDummyData() {
        dummyData = [
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
    }
        // 숫자가 커지면 view를 넘어가지 않게 하기 위한 계산 메서드
    func largest() -> Int {
        let data = dummyData.sorted(by: {$0.point > $1.point})
        return data.first!.point
    }
}


