//
//  DataManager.swift
//  TestMovieApp
//
//  Created by Орлов Максим on 07.04.2018.
//  Copyright © 2018 Орлов Максим. All rights reserved.
//

import Foundation

protocol UpcomingMoviesDataManagerType: class {
    func getMovieFeed(withPage: String)
}

class UpcomingMoviesDataManager: UpcomingMoviesDataManagerType {
    
    private let client = MovieClient()
    
    weak var presenter: UpcomingMoviesDataManagerPresenterType!
    
    init(presenter: UpcomingMoviesDataManagerPresenterType) {
        self.presenter = presenter
    }
    
    func getMovieFeed(withPage page: String) {
        self.client.getFeed(from: .upcoming, page: page, completion: {[weak self] result in
            switch result {
            case .success(let movieFeedResult):
                guard let movieResults = movieFeedResult?.results else { return }
                guard let totalPages = movieFeedResult?.total_pages else { return }
                guard let weakSelf = self else { return }
                weakSelf.presenter.movieFeedGetted(moviews: movieResults, totalPages: totalPages)
            case .failure(let error):
                print("the error \(error)")
            }
        })
    }
}


