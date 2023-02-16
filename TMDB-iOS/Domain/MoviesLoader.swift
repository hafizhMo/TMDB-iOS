//
//  MoviesLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

protocol MoviesLoader {

    typealias Result = Swift.Result<[Movies], Error>

    func load(completion: @escaping (Result) -> Void)
}
