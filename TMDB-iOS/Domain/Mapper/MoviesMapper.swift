//
//  MoviesItemMapper.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 14/02/23.
//

import Foundation

class MoviesMapper {

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Movies] {
        guard response.statusCode == 200, let items = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
            throw GeneralError.unexpectedData
        }

        let movies = items.results.map { remoteMovies in
            Movies(title: remoteMovies.title)
        }
        return movies
    }
}
