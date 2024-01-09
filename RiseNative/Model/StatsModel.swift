//
//  WalletModel.swift
//  RiseNative
//
//  Created by kehinde on 05/01/2024.
//

import Foundation


struct StatsModel : Decodable {
    let data : Stats
}

struct Stats: Decodable {
    var investmentBalance : Double
    var totalBalance : Double
    var percentageChange : Double
}


