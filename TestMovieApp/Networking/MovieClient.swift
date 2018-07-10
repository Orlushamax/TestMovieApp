//
//  MovieClient.swift
//  TestMovieApp
//
//  Created by Орлов Максим on 06.04.2018.
//  Copyright © 2018 Орлов Максим. All rights reserved.
//

import Foundation

class MovieClient: APIClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFeed(from movieFeedType: MovieFeed, page: String, completion: @escaping (Result<MovieResult?, APIError>) -> Void) {
        let endPoint = MovieFeedEndpoint(movieFeed: movieFeedType, page: page)
        let request = endPoint.request

        fetch(with: request, decode: {json -> MovieResult?  in
            guard let movieFeedResult = json as? MovieResult else { return nil }
            return movieFeedResult
        }, completion: completion)
    }
}
