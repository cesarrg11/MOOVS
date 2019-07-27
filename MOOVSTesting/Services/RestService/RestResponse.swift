//
//  RKRequest.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/14/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Rest response
class RestResponse : RestResponseProtocol,Codable{
    
    /// Is success
    var success: Bool?
    
    /// Status code
    var code: Int?
    
    /// Response body
    var Body: String?
    
    /// Response bytes
    var bytes: [UInt8]?
    
    /// Response content type
    var contentType: ContentType?
    
    /// Response data
    var data:Data?
    
    
    /// Init
    init() {
        
    }

    
    /// Required init
    ///
    /// - Parameter decoder: Decoder
    /// - Throws: Throws value
    required init(from decoder: Decoder) throws {
    }
    
    
    /// Encoder
    ///
    /// - Parameter encoder: Encoder
    /// - Throws: Throws values
    func encode(to encoder: Encoder) throws {
        
    }
    
   
    
}
