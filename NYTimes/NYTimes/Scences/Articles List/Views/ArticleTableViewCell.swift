//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var circleImageView: AsyncImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var articleBy: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    
    var article:ArticleViewModel! {
        didSet {
            title.text = article.title
            articleBy.text = article.byLine
            if article.imageURL != nil {
            circleImageView.loadUrl(article.imageURL)
            }
            publishDate.attributedText = UILabel.imageWithText(image: #imageLiteral(resourceName: "calendar"), text: article.publishedDate)
         }
    }

}
