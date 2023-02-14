//
//  MoviesLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 14/02/23.
//

import Foundation

class MoviesLoader {

    private let url: URL
    private let client: URLSession

    typealias Result = Swift.Result<[MoviesItem], Error>

    init(url: URL, client: URLSession) {
        self.url = url
        self.client = client
    }

    func load(completion: @escaping (Result) -> Void) {
        client.dataTask(with: url) { [weak self] data, response, _ in
            guard self != nil else { return }

            if let data = data, let response = response as? HTTPURLResponse {
                completion(MoviesLoader.map(data, response))
            } else {
                completion(.failure(NetworkError.networkError))
            }
        }.resume()
    }

    private static func map(_ data: Data, _ response: HTTPURLResponse) -> Result {
        do {
            let movies = try MoviesItemMapper.map(data, from: response)
            return .success(movies)
        } catch {
            return .failure(NetworkError.unexpectedData)
        }
    }
}
