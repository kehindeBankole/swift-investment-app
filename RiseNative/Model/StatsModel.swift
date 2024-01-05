//
//  WalletModel.swift
//  RiseNative
//
//  Created by kehinde on 05/01/2024.
//

import Foundation


struct StatsModel : Codable{
    let data : Stats
}

struct Stats: Codable {
    var investmentBalance : Double
    var totalBalance : Double
    var percentageChange : Double
}


