//
//  MoviesRemoteLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

class MoviesRemoteLoader: MoviesLoader {

    private let url: URL
    private let client: URLSession

    typealias Result = MoviesLoader.Result

    init(url: URL, client: URLSession) {
        self.url = url
        self.client = client
    }

    override func load(completion: @escaping (Result) -> Void) {
        client.dataTask(with: url) { [weak self] data, response, _ in
            guard self != nil else { return }
            if let data = data, let response = response as? HTTPURLResponse {
                completion(MoviesRemoteLoader.map(data, response))
            } else {
                completion(.failure(GeneralError.networkError))
            }
        }.resume()
    }

    private static func map(_ data: Data, _ response: HTTPURLResponse) -> Result {
        do {
            let movies = try MoviesMapper.map(data, from: response)
            return .success(movies)
        } catch {
            return .failure(GeneralError.unexpectedData)
        }
    }
}
