//
//  RestResponseProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/14/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Rest response protocol
protocol RestResponseProtocol: Codable {
    var success:Bool? {get}
    var code:Int? {get}
    var Body:String? {get}
    var bytes:[UInt8]? {get}
    var contentType: ContentType? {get set}
}
