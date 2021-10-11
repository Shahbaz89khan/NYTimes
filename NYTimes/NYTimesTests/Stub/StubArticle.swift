//
//  StubArticle.swift
//  NYTimesTests
//
//  Created by Shabaz Khan on 11.10.21.
//

import Foundation

@testable import NYTimes

class StubArticle: Article {
    static func dummyArticle() -> Article {
        return Article()
    }
}
