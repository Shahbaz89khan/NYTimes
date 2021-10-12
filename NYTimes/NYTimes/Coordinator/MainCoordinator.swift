//
//  MainCoordinator.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navController : UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewModel = ArticlesListViewModel()
        let viewController = storyBoard.instantiateViewController(identifier: "ArticlesListViewController") {
            ArticlesListViewController(coder: $0, andViewModel: viewModel)
        }
        
        viewController.coordinator  = self
        self.navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func openArticleDetail(_ articleViewModel : ArticleViewModel){
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(identifier: "ArticleDetailViewController") {
            ArticleDetailViewController(coder: $0, andViewModel: articleViewModel)
        }
        self.navigationController.pushViewController(vc, animated: true)
    }
}
