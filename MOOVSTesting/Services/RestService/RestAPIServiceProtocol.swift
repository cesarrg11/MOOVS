//
//  RestAPIServiceProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/7/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// RestAPIServiceProtocol
protocol RestAPIServiceProtocol{
    func request<X:RestRequest,Y:RestResponse>(method:RestMethod, obj:X,endpoint:String,urlParameter:[String:String]?,completion:@escaping(Y)->())
}
