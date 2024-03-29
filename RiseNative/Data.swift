//
//  Data.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//

import Foundation
import SwiftUI


@Observable class AppData{
    var isAuthenticated:Bool = false
    var path = NavigationPath()
    var mainpath = NavigationPath()
    var profile : Profile? = nil
    var wallet : WalletModel? = nil
    var stats : StatsModel? = nil
    var showBalance = false
    var plan : PlanModel? = nil
}
