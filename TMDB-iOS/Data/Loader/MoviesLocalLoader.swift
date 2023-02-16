//
//  MoviesLocalLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 15/02/23.
//

import Foundation

class MoviesLocalLoader: MoviesLoader {

    private let loader: MoviesLoader

    init(loader: MoviesLoader) {
        self.loader = loader
    }

    func load(completion: @escaping (MoviesLoader.Result) -> Void) {
        loader.load { result in
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
