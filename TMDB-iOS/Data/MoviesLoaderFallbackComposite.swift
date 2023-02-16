//
//  MoviesLoaderFallbackComposite.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

class MoviesLoaderFallbackComposite: MoviesLoader {

    private let primary: MoviesLoader
    private let fallback: MoviesLoader

    init(primary: MoviesLoader, fallback: MoviesLoader) {
        self.primary = primary
        self.fallback = fallback
    }

    override func load(completion: @escaping (MoviesLoader.Result) -> Void) {
        primary.load { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movies):
                completion(.success(movies))
            case .failure:
                self.fallback.load(completion: completion)
            }
        }
    }
}
