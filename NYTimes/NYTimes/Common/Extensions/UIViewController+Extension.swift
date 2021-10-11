//
//  UIViewController+Extension.swift
//  NYTimes
//
//  Created by Shahbaz Khan on 10.10.21.
//

import UIKit

extension UIViewController   {

    func showAlertView(title: String, message: String) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message:
                message, preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OKAY", style: .default, handler: {action in
            }))
            self.present(alertViewController, animated: true, completion: nil)
        }
        
    }
    
    private var activity: UIActivityIndicatorView {
        if self.view.viewWithTag(99999) is UIActivityIndicatorView{
            return self.view.viewWithTag(99999) as! UIActivityIndicatorView
        }else {
            let activity = UIActivityIndicatorView(style: .medium)
            activity.color = UIColor.gray
            activity.tag = 99999
            return activity
        }
    }
    
    func showActivityIndicator(){
        let activityIndicator = self.activity
        DispatchQueue.main.async {
            self.view.addSubview( activityIndicator)
            activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height / 2)
            activityIndicator.startAnimating()
            
        }
        
    }
    func hideActivityIndicator(){
        DispatchQueue.main.async {
            let activityIndicator = self.activity
            activityIndicator.removeFromSuperview()
            activityIndicator.stopAnimating()
            
        }
    }
    
}
