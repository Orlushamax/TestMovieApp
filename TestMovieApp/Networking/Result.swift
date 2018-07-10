//
//  Result.swift
//  TestMovieApp
//
//  Created by Орлов Максим on 06.04.2018.
//  Copyright © 2018 Орлов Максим. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
