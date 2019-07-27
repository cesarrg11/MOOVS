//
//  RestRequestProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/14/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Rest request protocol
protocol RestRequestProtocol:Codable {
    var contentType:ContentType? {get set}
    var body:String? {get set}
    var bytes:[UInt8]? {get set}
}
