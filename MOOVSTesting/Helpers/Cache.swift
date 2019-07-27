//
//  Cache.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Cache
class Cache {
    
    /// Key cache
    static private let keyCache = "AppCache"
    
    /// Cache object
    static private let cacheObject:NSCache<AnyObject,AnyObject> = NSCache()

    
    /// Temporal object
    static private var cache:[String:AnyObject] = [:]
    
    
    /// Keep object in cache
    ///
    /// - Parameters:
    ///   - object: Object to cache
    ///   - key: Object key
    static public func saveObject(object: AnyObject, key:String){
        cache[key] = object
        Cache.cacheObject.setObject(cache as AnyObject, forKey: keyCache as AnyObject)
    }
    
    
    /// Get object from cahe
    ///
    /// - Parameter key:
    /// - Returns: Object key
    static public func getObject(key:String)->AnyObject?{
        if cache.count == Int(), let cached = cacheObject.object(forKey: keyCache as AnyObject) {            
            Cache.cache = cached as! [String : AnyObject]
            cacheObject.evictsObjectsWithDiscardedContent = true
        }
        return Cache.cache[key]
    }
    
}
