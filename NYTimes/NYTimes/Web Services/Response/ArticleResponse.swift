//
//  ArticleResponse.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

class ArticleResponse: Decodable {
    let status: String
    let copyright: String
    let results: [Article]
    
    init(
        status: String,
        copyright: String,
        results: [Article]
    ) {
        self.status = status
        self.copyright = copyright
        self.results = results
    }
}
