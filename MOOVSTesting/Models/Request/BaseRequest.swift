//
//  BaseRequest.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/7/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Base request
class BaseRequest : RestRequest{
    
    
    /// Access key
    var accessKey: String?
    
    
    /// Init
    override init() {
        super.init()
        self.accessKey = Utils.getAppliection()?.appConfiguration?.properties.theMovieDBAPIKey
    }
    
    
    /// Required init
    ///
    /// - Parameter decoder: Deacode
    /// - Throws: Throws value
    required init(from decoder: Decoder) throws {
        super.init()
    }
    
}
