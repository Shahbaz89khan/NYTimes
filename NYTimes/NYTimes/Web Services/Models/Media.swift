//
//  Media.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

struct Media: Decodable {
    let copyright: String
    let caption: String
    let mediaMetaData: [MediaMetaData]
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case caption
        case mediaMetaData = "media-metadata"
    }
    
     func imageURL() ->  String? {
        var imgURL: String? = nil
        if mediaMetaData.count > 0 {
            let metaData = mediaMetaData[mediaMetaData.count - 1]
            imgURL = metaData.url
        }
        return imgURL
    }
}
