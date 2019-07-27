//
//  FileIOService.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/8/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// File IO service implementation
class FileIOService: FileIOServiceProtocol {
    
    
    /// Get file from bundle
    ///
    /// - Parameter name: File name
    /// - Returns: File as object
    func getFile<T>(name: String) -> T? where T : Decodable, T : Encodable {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try? JSONDecoder().decode(T.self, from: data)//try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                return jsonResult
            } catch {
                return nil
            }
        }
        return nil
    }
    
    
    /// Save file
    ///
    /// - Parameters:
    ///   - file: File to save
    ///   - name: File name
    func saveFile<T>(file: T, name: String) where T : Decodable, T : Encodable {
        
    }
    
}
