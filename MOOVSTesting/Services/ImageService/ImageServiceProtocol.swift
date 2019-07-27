//
//  ImageServiceProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/18/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Image service protocol
protocol ImageServiceProtocol {
    func get(identifier:String)->UIImage;
}
