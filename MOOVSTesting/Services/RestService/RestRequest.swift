//
//  RestRequest.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/14/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

class RestRequest:RestRequestProtocol{
    
    
    /// Content type
    var contentType: ContentType?
    
    
    /// Body
    var body: String?
    
    
    /// Bytes
    var bytes: [UInt8]?
    

    
    
    /// Init class
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
    /// - Throws: Throws value
    func encode(to encoder: Encoder) throws {
        
    }
}
