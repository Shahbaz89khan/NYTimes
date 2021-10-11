//
//  ArticlesListViewModel.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit
import Combine

class ArticlesListViewModel: NSObject {
    
    private var repo:ArticlesRemoteRepository
    private var subscriptions: Set<AnyCancellable> = []
    var articlesReloadPublisher: AnyPublisher<Bool, Never> {
        articlesReloadInternal.eraseToAnyPublisher()
    }
    
    private var articlesReloadInternal: PassthroughSubject<Bool, Never> = .init()
    private(set) var currentDisplayedArticles = [ArticleViewModel]()
    private var articles : [Article]! {
        didSet {
            currentDisplayedArticles = getDataToPresent(articles)
            articlesReloadInternal.send(true)
        }
    }
    let timePeriod:[TimePeriod] = [.Day,.Week,.Month]
    
    
    // Mark: - Intializater
    
    init(repo:ArticlesRemoteRepository = ArticlesRemoteRepository(service : ServiceApi())) {
        self.repo = repo
    }
    
    func fetchArticles() {
        repo.fetchArticles().sink(receiveCompletion: { [weak self] completion in
                                    switch completion {
                                    case  .failure(_):
                                        self?.articlesReloadInternal.send(false)
                                    case .finished: break // Nothing to do here, continuation is upon first received value
                                    }        }, receiveValue: { [weak self] articleResponse in
                                        self?.articles = articleResponse.results
                                    }).store(in: &subscriptions)
    }
    
    func setTimePeriod(timePeriod: TimePeriod) {
        repo.timePeriod = timePeriod
    }
    
    func currentTimePeriod() -> TimePeriod {
        return repo.timePeriod
    }
    
    func filterBy() ->  String {
        return repo.timePeriod.name
    }
    
    func shouldSendRequest(targetTimePeriod: TimePeriod) -> Bool {
        return targetTimePeriod != repo.timePeriod
    }
    
    // MARK: Data Transformer
    private func getDataToPresent(_ articles: [Article]) -> [ArticleViewModel] {
        var result = [ArticleViewModel]()
        articles.forEach { (article) in
            result.append(ArticleViewModel(article: article))
        }
        return result
    }
}
