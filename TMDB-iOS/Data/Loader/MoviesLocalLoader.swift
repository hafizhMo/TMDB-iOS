//
//  MoviesLocalLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 15/02/23.
//

import Foundation

class MoviesLocalLoader: MoviesLoader {
    override func load(completion: @escaping (MoviesLoader.Result) -> Void) {
        super.load { result in
            switch result {
            case .success(let movies):
                print("\(movies.count) items saved to local storage")
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
