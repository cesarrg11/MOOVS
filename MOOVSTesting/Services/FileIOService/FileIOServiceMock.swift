//
//  FileIOServiceMock.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/8/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Mock
class FileIOServiceMock: FileIOServiceProtocol {
    
    
    /// Mock
    ///
    /// - Parameter name: Mock
    /// - Returns: Mock
    func getFile<T>(name: String) -> T? where T : Decodable, T : Encodable {
        let objectClass: AnyClass! = NSClassFromString(String(describing: T.self))
        let objectType : NSObject.Type! = objectClass as! NSObject.Type?
        let theObject: NSObject! = objectType.init() as NSObject
        return theObject as? T//NSClassFromString(String(describing: T.self)) as? T
    }
    
    
    /// Mock
    ///
    /// - Parameters:
    ///   - file: Mock file
    ///   - name: Mock name
    func saveFile<T>(file: T, name: String) where T : Decodable, T : Encodable {
        
    }

}
