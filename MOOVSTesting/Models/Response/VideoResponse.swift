//
//  VideoResponse.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Video response
struct VideoResponse: Codable {
    
    
    /// Movie identifier
    var identifier:Int?
    
    
    /// Results
    var results:[MovieVideo]?
    
    
    /// Custom coding keys
    ///
    /// - identifier: Movie identifier
    /// - results: Results
    enum CondingKeys:String,CodingKey {
        case identifier = "id"
        case results
    }
}
