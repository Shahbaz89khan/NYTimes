//
//  ArticleViewModel.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit

class ArticleViewModel: NSObject {
    let title : String
    let byLine : String
    let publishedDate : String
    var caption : String? = nil
    var imageURL : URL? = nil

    
    init(article : Article) {
        self.title =  article.title
        self.byLine =  article.byline
        self.publishedDate = article.published_date
        if let urlString = article.imageURL(),
            let url = URL(string: urlString) {
           imageURL = url
        } 
        if let capt = article.caption() {
            self.caption = capt
        } 
    }
    
    
}
