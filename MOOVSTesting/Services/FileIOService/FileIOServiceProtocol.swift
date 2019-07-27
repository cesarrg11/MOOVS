//
//  FileIOServiceProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// File IO Service
protocol FileIOServiceProtocol {
    func getFile<T>(name:String) -> T? where T : Codable
    func saveFile<T>(file:T,name:String) where T : Codable
}
