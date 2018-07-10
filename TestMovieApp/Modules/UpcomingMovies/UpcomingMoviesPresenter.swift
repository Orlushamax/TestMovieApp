//
//  UpcomingMoviesPresenter.swift
//  TestMovieApp
//
//  Created by Орлов Максим on 07.04.2018.
//  Copyright © 2018 Орлов Максим. All rights reserved.
//

import UIKit

protocol UpcomingMoviesDataManagerPresenterType: class {
    func movieFeedGetted(moviews: [UpcomingMovie], totalPages: Int)
}

protocol UpcomingMoviesPresenterType {
    func getMovieFeed(withPage: String)
    func activityIndicatorStartAnimating()
    func activityIndicatorStopAnimating()
}

class UpcomingMoviesPresenter {
    
    weak var view: PresenterViewType?
    var dataManager: UpcomingMoviesDataManager?
    
    init(view: PresenterViewType) {
        self.view = view
        dataManager = UpcomingMoviesDataManager(presenter: self)
    }
    
    func getMoviewFeed(withPage page: String) {
        dataManager?.getMovieFeed(withPage: page)
    }
}

extension UpcomingMoviesPresenter: UpcomingMoviesDataManagerPresenterType {
    func movieFeedGetted(moviews: [UpcomingMovie], totalPages: Int) {
        DispatchQueue.main.async {
            self.view?.show(moviews: moviews, totalPages: totalPages)
        }
    }
    
    func activityIndicatorStartAnimating() {
        view?.activityIndicatorStartAnimating()
    }
    
    func activityIndicatorStopAnimating() {
        view?.acitivtyIndicatorStopAnimating()
    }
}
