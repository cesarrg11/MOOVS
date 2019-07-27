//
//  AppConfigurationProperties.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/8/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//


/// App configuration properties
struct AppConfigurationProperties : Codable {
    
    
    /// App name
    var appName:String?
    
    /// Version
    var version:String?
    
    /// App environment
    var environment:String?
    
    /// Images movie endpoint
    var imagesMoviewDBEndpoint:String?
    
    
    /// Api key
    var theMovieDBAPIKey:String?
    
    
    /// MoviewDB endpoint
    var theMovieDBEndpoint:String?
    
    
    /// Popular endpoint
    var popularEndpoint:String?
    
    
    /// Top rated endpoint
    var topRatedEndpoint:String?
    
    
    /// Upcoming endpoint
    var upcomingEndpoint: String?
    
    
    /// Videos endpoint
    var videosEndpoint:String?
    
}
