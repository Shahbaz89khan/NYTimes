//
//  ArticlesRemoteRepository.swift
//  NYTimes
//
//  Created by Shahbaz Khan on 10.10.21.
//

import UIKit
import Combine
protocol ArticlesRemoteRepositoryProtocol {
    func fetchArticles() -> AnyPublisher<ArticleResponse, NetworkError>

    
}

class ArticlesRemoteRepository : ArticlesRemoteRepositoryProtocol {
    
    var timePeriod = TimePeriod.Day

    var subscriptions: Set<AnyCancellable> = []

    private var serviceApi:ServiceApi
    init(service : ServiceApi) {
        self.serviceApi = service
    }
    
    func fetchArticles() -> AnyPublisher<ArticleResponse, NetworkError> {
        let serviceURL = baseURL + "/mostpopular/v2/mostviewed/all-sections/\(timePeriod.rawValue).json?api-key=\(apiKey)"       
        let request = URLRequest(url: URL.init(string: serviceURL)!)
                return serviceApi.getDataFromServer(request)
                    .map(\.value)
                    .eraseToAnyPublisher()
            }
       
}
