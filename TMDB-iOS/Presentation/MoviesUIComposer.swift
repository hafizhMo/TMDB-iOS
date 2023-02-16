//
//  MoviesUIComposer.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

class MoviesUIComposer {
    private init() {}

    static func moviesComposed(with loader: MoviesLoader) -> ViewController {
        let loader = MainQueueDispatchDecorator(decoratee: loader)
        return ViewController(with: loader)
    }
}

extension MainQueueDispatchDecorator: MoviesLoader where T == MoviesLoader {
    func load(completion: @escaping (MoviesLoader.Result) -> Void) {
        decoratee.load { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
