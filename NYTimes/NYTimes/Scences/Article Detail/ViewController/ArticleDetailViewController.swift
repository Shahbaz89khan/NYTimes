//
//  ArticleDetailViewController.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit

class ArticleDetailViewController: UIViewController  {
    
    @IBOutlet weak var imageView: AsyncImageView!
    @IBOutlet weak var imageCaption: UILabel!
    @IBOutlet weak var articleDesp: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var imageDownloadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var selectColumnView: UIView!
    
    var article: ArticleViewModel
    required init?(coder: NSCoder, andViewModel viewModel : ArticleViewModel) {
        self.article = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ArticleDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        if let imgURL = article.imageURL {
            imageView.loadUrl(imgURL)
        }
        
        if let imageCaption = article.caption {
            self.imageCaption.text = imageCaption
        }
        publishedDate.text = article.publishedDate
    }
    
}
