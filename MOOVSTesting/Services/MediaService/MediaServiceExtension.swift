//
//  MediaServiceExtension.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/18/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

/// Media service extension
extension MediaService{
    
    
    /// Get list media
    ///
    /// - Parameter category: Category requested
    /// - Returns: Generic value
    func getList<T>(category:MediaCategory) -> [T]? {
        switch category {
            
            case MediaCategory.popular:
                return self.popular as? [T]
            
            case MediaCategory.topRated:
                return self.topRatedMedia as? [T]
            
            case MediaCategory.upcoming:
                return self.upcomingMedia as? [T]
        }
    }
    
    /// Set list media
    ///
    /// - Parameter category: Media category
    /// - Returns: Void
    func setList(category:MediaCategory,media:[MediaProtocol]){
        switch category {
            
        case MediaCategory.popular:
            self.popular = media
            
        case MediaCategory.topRated:
            self.topRatedMedia = media
            
        case MediaCategory.upcoming:
            self.upcomingMedia = media
        }
    }
}
