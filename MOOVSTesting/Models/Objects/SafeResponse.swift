//
//  SafeResponse.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Safe response
class SafeResponse<T> {
    
    /// Result code
    var code:Int?
    
    /// Message
    var message:String?
    
    /// Response data
    var data:T?
    
    /// Error 
    var error:String?
}
