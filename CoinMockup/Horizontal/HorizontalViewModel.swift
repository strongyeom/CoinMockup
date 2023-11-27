//
//  HorizontalViewModel.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/27.
//

import SwiftUI

class HorizontalViewModel: ObservableObject {
    
    
    @Published var value = 0.0

    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.value += 0.5
        }
    }
}
