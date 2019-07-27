//
//  MovieVideo.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Movie video
struct MovieVideo: Codable {
    
    
    /// Identifier
    var identifier:String?
    
    /// ISO 639 1
    var iso_639_1:String?
    
    /// ISO 3166 1
    var iso_3166_1:String?
    
    /// Key
    var key: String?
    
    /// Name
    var name: String?
    
    /// Site
    var site: String?
    
    /// Size
    var size: Int?
    
    /// Type
    var type: String?
    

    /// Custom keys
    enum CodingKeys:String,CodingKey {
        case identifier = "id"
        case iso_639_1
        case iso_3166_1
        case key
        case name
        case site
        case size
        case type
    }
}
