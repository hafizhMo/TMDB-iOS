//
//  MoviesItemMapper.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 14/02/23.
//

import Foundation

class MoviesItemMapper {

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [MoviesItem] {
        guard response.statusCode == 200, let items = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
            throw NetworkError.unexpectedData
        }

        let movies = items.results.map { remoteMovies in
            MoviesItem(title: remoteMovies.title)
        }
        return movies
    }
}
