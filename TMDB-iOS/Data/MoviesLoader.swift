//
//  MoviesLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 14/02/23.
//

import Foundation

class MoviesLoader {

    typealias Result = Swift.Result<[MoviesItem], Error>

    func load(completion: @escaping (Result) -> Void) {}

}
