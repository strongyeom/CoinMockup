//
//  UpbitAPI.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/21.
//

import Foundation

struct Market: Codable, Hashable {
    let market: String
    let koreanName: String
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

struct UpbitAPI {
    private init() { }
    
    static func fetchAllMarket(completionHandler: @escaping ([Market]) -> Void) {
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
                    completionHandler(decodedData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
