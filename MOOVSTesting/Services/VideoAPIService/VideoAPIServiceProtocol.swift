//
//  ViewAPIServiceProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/25/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Videp API Service protocol
protocol VideoPIServiceProtocol{
    func getVideo(request:VideoRequest, completation:@escaping (MovieVideo?)->())
}
