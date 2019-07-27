//
//  BaseViewController.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/25/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var loaginView:UIView!
    var activityIndicator: UIActivityIndicatorView!
    
    var isLoading:Bool = Bool(){
        didSet{
            //showLoading(show: self.isLoading)
        }
    }
    
    private func createLoading(){
        self.loaginView = UIView(frame: UIScreen.main.bounds)
        self.loaginView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        self.loaginView.addSubview(self.activityIndicator)
    }
    
    private func showLoading(show:Bool){
        show ? self.topMostViewController().view.addSubview(self.loaginView!) : self.loaginView.removeFromSuperview()
        show ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.createLoading()
        
    }

}
