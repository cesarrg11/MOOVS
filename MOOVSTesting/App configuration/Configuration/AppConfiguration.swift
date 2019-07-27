//
//  AppConfiguration.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/8/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import Foundation


/// App environment
let environment: Environment = .development


/// App configuration 
class AppConfiguration : AppConfigurationProtocol {
    
    
    /// Configuration properties
    var properties:AppConfigurationProperties
    
    
    /// Shared instance
    public static let shared:AppConfiguration = AppConfiguration()
    
    
    /// File service
    private var fileService:FileIOServiceProtocol?
    
    
    /// Init class
    init() {
        self.fileService = ServiceLocator.resolve()
        self.properties = self.fileService?.getFile(name: "\(environment.rawValue)Configuration") ?? AppConfigurationProperties()
    }
    
}
