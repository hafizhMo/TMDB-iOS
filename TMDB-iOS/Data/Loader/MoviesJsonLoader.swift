//
//  MoviesJsonLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

class MoviesJsonLoader: MoviesLoader {

    override func load(completion: @escaping (MoviesLoader.Result) -> Void) {
        guard let url = Bundle.main.url(forResource: "Movies", withExtension: "json") else {
            completion(.failure(GeneralError.missingJSONFile))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(MoviesResponse.self, from: data)
            let movies = jsonData.results.map { remoteMovie in
                Movies(title: remoteMovie.title)
            }
            completion(.success(movies))
        } catch {
            completion(.failure(GeneralError.unexpectedData))
        }
    }
}
