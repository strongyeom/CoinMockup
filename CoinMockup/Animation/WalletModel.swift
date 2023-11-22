//
//  WalletModel.swift
//  CoinMockup
//
//  Created by 염성필 on 2023/11/22.
//
import SwiftUI

struct WalletModel : Hashable {
    let color = Color.random()
    let name : String
    let index : Int
}

var wallets:[WalletModel] = [
    WalletModel(name: "Hue Card", index: 0),
    WalletModel(name: "Jack Card", index: 1),
    WalletModel(name: "Bran Card", index: 2),
    WalletModel(name: "KoKo Card", index: 3)
]
