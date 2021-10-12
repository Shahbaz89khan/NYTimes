//
//  Coordinator.swift
//  NYTimes
//
//  Created by Shabaz Khan on 10.10.21.
//

import UIKit

protocol Coordinator {
    var navigationController : UINavigationController {get set}
    func start()
}

