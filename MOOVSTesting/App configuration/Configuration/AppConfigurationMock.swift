//
//  AppConfigurationMock.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/12/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Mock
public class AppConfigurationMock: AppConfigurationProtocol {
    
    ///Mock
    var properties: AppConfigurationProperties
    
    
    /// Init mock
    init() {
        self.properties = {
            let properties: AppConfigurationProperties = AppConfigurationProperties(appName: String(),
                                                                                    version: String(),
                                                                                    environment: String(),
                                                                                    imagesMoviewDBEndpoint: String(),
                                                                                    theMovieDBAPIKey: String(),
                                                                                    theMovieDBEndpoint: String(),
                                                                                    popularEndpoint: String(),
                                                                                    topRatedEndpoint: String(),
                                                                                    upcomingEndpoint: String(),
                                                                                    videosEndpoint: String())
            return properties
        }()
    }

}
