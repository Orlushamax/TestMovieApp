//
//  MoviewResult.swift
//  TestMovieApp
//
//  Created by Орлов Максим on 07.04.2018.
//  Copyright © 2018 Орлов Максим. All rights reserved.
//

import Foundation

struct MovieResult: Decodable {
    let results: [UpcomingMovie]?
    let total_pages: Int
}
