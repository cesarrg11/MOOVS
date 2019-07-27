//
//  MediaProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/17/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Media protocol
protocol MediaProtocol:Codable {
    
    var genreIdentifiers: [Int]? {get set}
    var popularity: Double? {get set}
    var originalLanguage: String? {get set}
    var identifier: Int? {get set}
    var voteAverage: Double? {get set}
    var voteCount:Int? {get set}
    var posterPath: String? {get set}
    var overview: String? {get set}
    var type: MediaType? {get set}
    
}
