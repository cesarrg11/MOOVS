//
//  ImageService.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/18/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Service for get images
class ImageService: ImageServiceProtocol {

    
    //MARK: - Private
    
    
    /// Get image
    ///
    /// - Parameter identifier: Image identifier
    /// - Returns: A image
    private func getImage(identifier:String) -> UIImage{
        var image:UIImage?
        if let _image:UIImage = Cache.getObject(key: identifier) as? UIImage{
            image = _image
        }else{
            image = self.getImageURL(url: "\((Utils.getAppProperties()?.imagesMoviewDBEndpoint)!)\(identifier)",identifier: identifier)
        }
        return image != nil ? image! : .movieAvatar
    }
    
    
    /// Get image from url
    ///
    /// - Parameters:
    ///   - url: Image url
    ///   - identifier: Image identifier
    /// - Returns: A possible image
    private func getImageURL(url:String,identifier:String) -> UIImage?{
        var image: UIImage?
        print("Image requested: \(url))")
        if let url = URL(string: url), let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)
            if let _image = image{
                Cache.saveObject(object: _image as AnyObject, key: identifier)
            }
        }
        return image
    }
    

    //MARK: - Public

    
    /// Get image
    ///
    /// - Parameter identifier: Image identifier
    /// - Returns: A image
    func get(identifier: String) -> UIImage {
        return self.getImage(identifier: identifier)
    }
    
    
    

}
