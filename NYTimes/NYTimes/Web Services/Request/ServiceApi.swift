//
//  ServiceApi.swift
//  NYTimes
//
//  Created by Shahbaz Khan on 10.10.21.
//

import UIKit
import Combine
struct ServiceApi: WebAPIHandler {
    private var session = URLSession.shared
    
    init(
        session : URLSession = URLSession.shared
    ) {
        self.session = session
    }
    
    func getDataFromServer<T: Decodable>(_ request: URLRequest)-> AnyPublisher<Response<T>, NetworkError>{
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder.init().decode(T.self, from: result.data)
                return Response(value: value)
            }
            .mapError{ err -> NetworkError in
                return NetworkError.parsingError(err.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


