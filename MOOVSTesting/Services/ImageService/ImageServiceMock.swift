//
//  ImageServiceMock.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Mock
class ImageServiceMock: ImageServiceProtocol {
    
    /// Mock
    ///
    /// - Parameter identifier: Mock id
    /// - Returns: UIImage empty
    func get(identifier: String) -> UIImage {
        return UIImage()
    }
    

}
