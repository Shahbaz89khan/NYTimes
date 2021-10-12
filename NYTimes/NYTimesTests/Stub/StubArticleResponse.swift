//
//  StubArticleResponse.swift
//  NYTimesTests
//
//  Created by Shabaz Khan on 11.10.21.
//

import Foundation
@testable import NYTimes

final class StubArticleResponse: ArticleResponse {
    static func getDummyResponse() -> ArticleResponse {
        let article = Article(id: 12, title: "Dummy title", byline: "Dummy by line", published_date: "10-10-2021", media: [Media(copyright: "Dummy copyrights", caption: "dummy caption", mediaMetaData: [MediaMetaData(url: "https://static01.nyt.com/images/2016/11/24/us/map-dialect/map-dialect-mediumThreeByTwo210-v2.png", width: 200, height: 200)])], url: "https://static01.nyt.com/images/2016/11/24/us/map-dialect/map-dialect-mediumThreeByTwo210-v2.png")
        return ArticleResponse(status: "Dummy Status", copyright: "Dummy rights", results: [article])
    }
}
