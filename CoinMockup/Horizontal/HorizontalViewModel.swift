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
    
    func fetchOrderBook(completionHandler: @escaping ([Market]) -> Void) {
        let url = URL(string: "https://api.upbit.com/v1/orderbook?markets=KRW-BTC")!
        
        // 테스트 용이기 때문에 data만 받음
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
              //  print(decodedData)
                DispatchQueue.main.async {
                    completionHandler(decodedData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.value += 0.5
            // 타이머가 동작할때마다 데이터(DummyData)가 달라지게끔 구성
            self.fetchDummyData()
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


