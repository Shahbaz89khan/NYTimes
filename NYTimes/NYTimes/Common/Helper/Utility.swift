//
//  Utility.swift
//  NYTimes
//
//  Created by Shabaz Khan on 12.10.21.
//

import UIKit

final class Utility {
    static func showAlert(title: String, message: String, on viewController: UIViewController) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message:
                message, preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            }))
            viewController.present(alertViewController, animated: true, completion: nil)
        }
        
    }
}
