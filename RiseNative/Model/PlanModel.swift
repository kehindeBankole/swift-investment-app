//
//  PlanModel.swift
//  RiseNative
//
//  Created by kehinde on 13/01/2024.
//

import Foundation

struct PlanResponse : Decodable {
    var name : String
    var totalDeposited : Double
    var planType : String

}


struct PlanModel : Decodable {
  var data : [PlanResponse]
}
