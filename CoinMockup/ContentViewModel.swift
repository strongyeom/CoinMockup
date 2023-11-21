//
//  ContentViewModel.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/21.
//

import Foundation

class ContentViewModel : ObservableObject {
    
    // 데이터가 바뀔때마다 View를 업데이트 함 ( 랜더링 ) 
    @Published var banner: String = "23,322,222,123 원"
    @Published var money: [Market] = []

    func fetchAllMarket() {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
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
                    self.money = decodedData
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
