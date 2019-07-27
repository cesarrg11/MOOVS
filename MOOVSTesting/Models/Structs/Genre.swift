//
//  Genre.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/21/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//


/// Genre properties
struct Genre {
    
    /// Identifier
    var identifier:String?
    
    /// Name
    var name:String?
    
    
    /// Coding keys from sevice
    ///
    /// - identifier: Identifier
    /// - name: name
    enum CodingKeys:String,CodingKey {
        case identifier = "id"
        case name
    }
}
