//
//  ArticlesListViewModelTests.swift
//  NYTimesTests
//
//  Created by Shabaz Khan on 11.10.21.
//

import Foundation
import XCTest

@testable import NYTimes

class ArticlesListViewModelTests: XCTestCase {
    var sut: ArticlesListViewModel!
    var stubRepo:StubArticlesRemoteRepository!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        stubRepo = StubArticlesRemoteRepository()
        sut = ArticlesListViewModel()
    }

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    


