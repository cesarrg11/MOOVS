//
//  ServiceLocatorProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Service locator protocol
protocol ServiceLocatorProtocol {
    static func resolve<T>() -> T?
}
