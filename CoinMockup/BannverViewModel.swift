//
//  BannverViewModel.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/21.
//

import Foundation

class BannerViewModel : ObservableObject {
    
    @Published var banner: Banner = Banner()
    
    func fetchBanner() {
        banner = Banner()
    }
}
