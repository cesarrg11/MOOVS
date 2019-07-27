//
//  MediaType.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/7/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import Foundation


/// Media type
///
/// - movie: Movie tyep
/// - tvShow: TV show type
enum MediaType:String, Codable{
    case movie = "movie"
    case tvShow = "tv"
}
