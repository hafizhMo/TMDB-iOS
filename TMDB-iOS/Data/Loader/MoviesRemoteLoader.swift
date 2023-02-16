//
//  MoviesRemoteLoader.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

class MoviesRemoteLoader: MoviesLoader {

    private let url: URL
    private let client: HTTPClient

    typealias Result = Swift.Result<[Movies], Error>

    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    func load(completion: @escaping (Result) -> Void) {
        client.request(from: url) { results in
            switch results {
            case let .success((data, response)):
                completion(MoviesRemoteLoader.map(data, response))
            case .failure:
                completion(.failure(GeneralError.networkError))
            }
        }
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
