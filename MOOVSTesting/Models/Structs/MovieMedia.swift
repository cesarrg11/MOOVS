//
//  MovieMedia.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/17/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

struct MovieMedia: MediaProtocol {

    
    /// Genre ids
    var genreIdentifiers: [Int]?
    
    /// Popularity
    var popularity: Double?
    
    /// Original language
    var originalLanguage: String?
    
    /// Identifier
    var identifier: Int?
    
    /// Vote average
    var voteAverage: Double?
    
    /// Poster path
    var posterPath: String?
    
    /// Media type
    var type: MediaType?
    
    /// Vote counr
    var voteCount: Int?
    
    /// Has video
    var video:Bool?
    
    /// Title
    var title: String?
    
    /// Original title
    var originalTitle: String?
    
    /// Backdrop path
    var backdropPath: String?
    
    /// Is adult
    var adult: Bool?
    
    /// Overview
    var overview: String?
    
    /// Release date
    var releaseDate: String?

    /// Dates
    var dates: MovieDates?
    
    
    
    
    
    /// Custom keys
    enum CodingKeys:String,CodingKey {
        
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case genreIdentifiers = "genre_ids"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case identifier = "id"
        
        case video
        case title
        case adult
        case popularity
        case overview
        case dates
    }
}
