//
//  Utils.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/12/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Utils
class Utils {

    /// Get shared app
    ///
    /// - Returns: Shared app
    static public func getAppliection() -> AppDelegate?{
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    
    /// Get app properties
    ///
    /// - Returns: Properties of project
    static public func getAppProperties() -> AppConfigurationProperties?{
        return Utils.getAppliection()?.appConfiguration?.properties
    }
    
    

    
}
