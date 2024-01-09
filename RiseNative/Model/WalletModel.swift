//
//  WalletModel.swift
//  RiseNative
//
//  Created by kehinde on 05/01/2024.
//

import Foundation


struct WalletModel : Decodable {
    let data : WalletData
}
struct WalletData: Decodable {
    var wallet: Wallet
}

struct Wallet: Decodable {
    var balance: Double
}

