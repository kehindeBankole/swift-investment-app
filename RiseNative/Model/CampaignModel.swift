//
//  CampaignModel.swift
//  RiseNative
//
//  Created by kehinde on 31/12/2023.
//

import Foundation

enum ArticleType : String {
    case image = "image"
    case article = "article"
    case video = "video"
}

struct CampaignModel : Decodable , Hashable {
    let id: String
    let title : String
    let description : String?
    let campaign_type : ArticleType.RawValue
    let thumbnail_url : String?
    let article_url : String?
    let media_url : String?
}
