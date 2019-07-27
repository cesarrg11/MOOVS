//
//  TVShowMedia.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/17/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Tv show media
struct TVShowMedia: MediaProtocol {
    
    
    /// Original name
    var originalName: String?
    
    /// name
    var name: String?
    
    /// Origin country
    var originCountry: [String]?
    
    /// Vote count
    var voteCount: Int?
    
    /// First air date
    var firstAirDate: String?
    
    /// Backdrop path
    var backdropPath: String?
    
    /// Overview
    var overview: String?
    
    /// Genre identfifiers
    var genreIdentifiers: [Int]?
    
    /// Popularity
    var popularity: Double?
    
    /// Orinal language
    var originalLanguage: String?
    
    /// Identifier
    var identifier: Int?
    
    /// Vote average
    var voteAverage: Double?
    
    /// Porster path
    var posterPath: String?
    
    /// MEdia type
    var type: MediaType?
    

    /// Custom keys
    enum CodingKeys:String,CodingKey {
        
        case originalName = "original_name"
        case originCountry = "origin_country"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case genreIdentifiers = "genre_ids"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case identifier = "id"
        
        case popularity
        case overview
        case name
        
    }
    

}
