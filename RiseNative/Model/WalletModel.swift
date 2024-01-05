//
//  WalletModel.swift
//  RiseNative
//
//  Created by kehinde on 05/01/2024.
//

import Foundation


struct WalletModel : Codable{
    let data : WalletData
}
struct WalletData: Codable {
    var wallet: Wallet
}

struct Wallet: Codable {
    var balance: Double
}

