//
//  MovieModel.swift
//  TopMovie
//
//  Created by Hader on 02/07/2025.
//

import Foundation

import Foundation

struct MovieResponse: Codable {
    var page: Int?
    var results: [Movie]?
    var totalPages: Int?
    var totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// Movie item model
struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var backdropPath: String?
    var genreIDs: [Int]?
    var releaseDate: String?
    var voteAverage: Double?
    var voteCount: Int?
    var popularity: Double?
    var originalLanguage: String?
    var adult: Bool?
    var video: Bool?
    var isFav: Bool?
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
        case originalLanguage = "original_language"
        case adult
        case video
        case isFav
    }

    // Computed property to get full poster URL
    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }

    // Computed property to get full backdrop URL
    var backdropURL: URL? {
        guard let path = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w780\(path)")
    }
}


struct AddFav : Codable{
    var success : Bool?
    var status_code : Int?
    var status_message : String?
}
