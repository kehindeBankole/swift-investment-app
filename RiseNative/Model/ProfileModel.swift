//
//  ProfileModel.swift
//  RiseNative
//
//  Created by kehinde on 30/12/2023.
//

import Foundation

struct Profile : Decodable{
    let id : Int?
    let uuid : String?
    let profilePicUrl : String?
    let message : String?
    let firstName:String
}
