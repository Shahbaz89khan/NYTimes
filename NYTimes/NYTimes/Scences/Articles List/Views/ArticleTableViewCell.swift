//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var circleImageView: AsyncImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var articleBy: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    
    var article:ArticleViewModel? {
        didSet {
            title.text = article?.title
            articleBy.text = article?.byLine
            if let imageURL = article?.imageURL {
                circleImageView.loadUrl(imageURL)
            }
            publishDate.attributedText = UILabel.imageWithText(image: #imageLiteral(resourceName: "calendar"), text: article?.publishedDate ?? "")
         }
    }
}
