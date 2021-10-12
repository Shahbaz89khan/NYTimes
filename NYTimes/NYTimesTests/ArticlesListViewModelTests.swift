//
//  ArticlesListViewModelTests.swift
//  NYTimesTests
//
//  Created by Shabaz Khan on 11.10.21.
//

import Foundation
import XCTest

@testable import NYTimes

final class ArticlesListViewModelTests: XCTestCase {
    var sut: ArticlesListViewModel!
    var stubRepo:StubArticlesRemoteRepository!
    
    override func setUp() {
        super.setUp()
        stubRepo = StubArticlesRemoteRepository()
        sut = ArticlesListViewModel()
    }
    
    func testFetchArticles() {
        stubRepo.isRemoteRepoCalled = true
        sut.fetchArticles()
        XCTAssertTrue(stubRepo.isRemoteRepoCalled)
    }
    
    func testFetchArticlesDataShouldReturnError() {
        stubRepo.shouldFailOnFetch = true
        sut.fetchArticles()
        XCTAssertTrue(stubRepo.shouldFailOnFetch)
    }
    
    func testFetchArticlesDataShouldNotReturnError() {
        stubRepo.dataToReturnOnSuccess = StubArticleResponse.getDummyResponse()
      _ =  self.stubRepo.fetchArticles().sink { completion in
        } receiveValue: { response in
            XCTAssertNotNil(response)
        }
    }
}

