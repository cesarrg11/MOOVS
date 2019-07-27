//
//  Extensions.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit



// MARK: - UIViewController extension

/// UIViewController extension
extension UIViewController {
    
    /// Get top view controller
    func topMostViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
}


// MARK: - UIApplication extension

/// UIApplication extension
extension UIApplication {
    
    
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}


//MARK: UIImageView


/// Extension for UIImageView
extension UIImageView{
    /// Set image from ImageService
    ///
    /// - Parameter url: URL image
    func setImage(url:String){
        guard let service:ImageServiceProtocol = ServiceLocator.resolve() else {
            return
        }
        self.image = service.get(identifier: url)
    }
}


//MARK: - Colors


/// Addind custom colors
extension UIColor{
    /// Red soft
    class var redSoft:UIColor{
        return UIColor(red: 216.0/255.0, green: 57.0/255.0, blue: 57.0/255.0, alpha: 1.0)
    }
}

//MARK: -  String

/// String extension
extension String{
    
    
    /// Localizaed string
    ///
    /// - Parameter comments: Comments
    /// - Returns: Localized strgin
    func localized(withComment comments:String = String()) -> String{
        return NSLocalizedString(self, comment: comments)
    }
}

