//
//  Article.swift
//  NYTimes
//
//  Created by Shahbaz Khan on 10.10.21.
//



struct Article: Decodable {
    let id: Int
    let title: String
    let byline: String
    let published_date: String
    let media: [Media]
    let url: String
    
    func imageURL() -> String? {
        var imageURL: String? = nil
        if media.count > 0 {
            let imageMetaData = media[media.count - 1]
            imageURL = imageMetaData.imageURL()
        }
        return imageURL
    }
    
    func caption() -> String? {
        var caption: String? = nil
        if media.count > 0 {
            let imageMetaData = media[media.count - 1]
            caption = imageMetaData.caption
            if caption == "" {
                caption = imageMetaData.copyright
            }
        }
        return caption
    }
}
