//
//  MoviesFactory.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 16/02/23.
//

import Foundation

class MoviesFactory {

    private init() {}

    static func create() -> ViewController {
        // Remote
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2696829a81b1b5827d515ff121700838")!
        let session = URLSession(configuration: .ephemeral)
        let client = URLSessionHTTPClient(session: session)
        let remote = MoviesRemoteLoader(url: url, client: client)

        // Remote Decorator
        let localLoader = MoviesLocalLoader(loader: remote)

        // JSON
        let jsonLoader = MoviesJsonLoader()

        // Loader
        let composite = MoviesLoaderFallbackComposite(primary: localLoader, fallback: jsonLoader)

        return MoviesUIComposer.moviesComposed(with: composite)
    }
}
