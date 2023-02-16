//
//  MoviesResponse.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 14/02/23.
//

import Foundation

// swiftlint:disable identifier_name

struct MoviesResponse: Codable {
    let page: Int
    let results: [MoviesResultResponse]
    let total_pages: Int
    let total_results: Int
}

struct MoviesResultResponse: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
