//
//  MediaServiceProtocol.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Media service protocol
protocol MediaServiceProtocol{
    func getMediaList(request: MediaRequest, completion: @escaping (SafeResponse<[MediaProtocol]>)->())
}
