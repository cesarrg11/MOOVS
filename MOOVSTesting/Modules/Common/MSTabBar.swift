//
//  MSTabBar.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/10/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

class MSTabBar: UITabBar {

  
    
    override func awakeFromNib() {
        //self.setItems([UITabBarItem(title: "Movies", image: nil, tag: Int()),UITabBarItem(title: "TV Show", image: nil, tag: Int())], animated: false)
        self.addSubview(UIButton(type: .custom))
    }

}
