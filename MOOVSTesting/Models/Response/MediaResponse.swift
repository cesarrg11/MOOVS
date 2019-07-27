//
//  MediaResponse.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/14/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Media response
struct MediaResponse<T:Codable>:Codable{
    
    
    /// Current page
    var page: Int?
    
    
    /// Total results
    var totalResults:Int?
    
    
    /// Total pages
    var totalPages: Int?
    
    
    /// Results
    var mediaList:[T]?
    

    
    /// Custom keys
    ///
    /// - totalResults: Total results
    /// - totalPages: Total pages
    /// - mediaList: Results
    /// - page: Current page
    enum CodingKeys: String,CodingKey {
        
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case mediaList = "results"
        case page = "page"
    }
    
}
