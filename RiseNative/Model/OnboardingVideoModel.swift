//
//  OnboardingVideoModel.swift
//  RiseNative
//
//  Created by kehinde on 08/01/2024.
//

import Foundation

struct OnboardingVideoModel : Decodable {
    let title : String
    let display_duration : Int
    let platform : String
    let thumbnail_url : String
    let url : String
}
