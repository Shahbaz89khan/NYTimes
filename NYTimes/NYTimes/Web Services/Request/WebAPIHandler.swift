//
//  WebAPIHandler.swift
//  NYTimes
//
//  Created by Shahbaz Khan on 10.10.21.
//

import Combine
import Foundation

struct Response<T> {
        let value: T
     }

protocol WebAPIHandler {
    func getDataFromServer<T: Decodable>(_ request: URLRequest)-> AnyPublisher<Response<T>, NetworkError>
}
