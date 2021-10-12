//
//  ArticlesListViewController.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit
import Combine

final class ArticlesListViewController: UIViewController {
    private var viewModel: ArticlesListViewModel
    private var subscriptions: Set<AnyCancellable> = []
    @IBOutlet var tableView : UITableView!
    weak var coordinator: MainCoordinator?
    
    required init?(
        coder: NSCoder,
        andViewModel viewModel: ArticlesListViewModel
    ) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(
        coder: NSCoder
    ) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        setupPullToRefreshControl()
        setupFilterButton()
    }
    
    func setupFilterButton() {
        let addButton = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(showFilterOptions(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func configureViewModel() {
        viewModel = ArticlesListViewModel()
        viewModel.articlesReloadPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                guard let strongSelf = self else { return }
                if status {
                    self?.tableView.reloadData()
                } else {
                    Utility.showAlert(title: "Error", message: "Some error occurred", on: strongSelf)
                }
                self?.hideActivityIndicator()
                self?.tableView.refreshControl?.endRefreshing()
            }.store(in: &subscriptions)
        
        fetchArticles()
    }
    
    @objc private func fetchArticles(){
        self.showActivityIndicator()
        viewModel.fetchArticles()
    }
    
    private func setupPullToRefreshControl(){
        self.tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        tableView.refreshControl?.addTarget(self, action: #selector(fetchArticles), for: UIControl.Event.valueChanged)
    }
    
    private func openArticleDetail(_ index : Int) {
        let articleViewModel = viewModel.currentDisplayedArticles[index]
        coordinator?.openArticleDetail(articleViewModel)
    }
}

extension ArticlesListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentDisplayedArticles.count
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Showing the filter by in table view section
        return "Filter By " + viewModel.filterBy()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell : ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        tableViewCell.article = viewModel.currentDisplayedArticles[indexPath.row]
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        openArticleDetail(indexPath.row)
    }
}

extension ArticlesListViewController: UIActionSheetDelegate {
    @objc func showFilterOptions(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Choose Filter", message: "Article will be shown based on following filter. Please choose one.", preferredStyle: .alert)
        
        for item in viewModel.timePeriod {
            let action = UIAlertAction(title: item.name,
                                       style: UIAlertAction.Style.default,
                                       handler: {[unowned self] (action: UIAlertAction!) in
                                        
                                        if let title = action.title {
                                            let period = TimePeriod.init(rawValue: title)
                                            if self.viewModel.shouldSendRequest(targetTimePeriod: period) {
                                                self.viewModel.setTimePeriod(timePeriod: period)
                                                self.fetchArticles()
                                            }
                                        }
                                       })
            
            alertController.addAction(action)
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
}
