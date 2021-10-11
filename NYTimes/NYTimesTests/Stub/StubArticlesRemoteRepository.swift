//
//  StubArticlesRemoteRepository.swift
//  NYTimesTests
//
//  Created by Shabaz Khan on 11.10.21.
//

import Foundation
import Combine
@testable import NYTimes

class StubArticlesRemoteRepository: ArticlesRemoteRepositoryProtocol {
    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:ArticleResponse?
    var isRemoteRepoCalled = false
    
    func fetchArticles() -> AnyPublisher<ArticleResponse, NetworkError> {
        isRemoteRepoCalled = true
        return  Just(dataToReturnOnSuccess!)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
