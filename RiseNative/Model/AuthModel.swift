//
//  AuthModel.swift
//  RiseNative
//
//  Created by kehinde on 30/12/2023.
//

import Foundation

struct PostRequestData: Encodable {
    let email: String
    let password :String
}

struct LoginRes : Decodable {
    let token : String?
    let message : String?
}
