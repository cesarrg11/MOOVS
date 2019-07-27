//
//  DetailProtocols.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/25/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit

//MARK: - Presenter


/// Presenter protocol
protocol DetailPresenterProtocol: class {
    
    var view: DetailViewProtocol? {get set}
    var wireFrame: DetailWireFrameProtocol? {get set}
    var interactor: DetailInputInteractorProtocol? {get set}
    
    func viewDidLoad()
}

//MARK: - View


/// View protocol
protocol DetailViewProtocol: class {
    func showMedia(_ media:MediaProtocol)
    func showVideo(video:String)
}

//MARK: - Interactor


/// In interactor protocol
protocol DetailInputInteractorProtocol: class {
    var presenter: DetailOutputInteractorProtocol? {get set}
    func getVideo(video:Int)
}


/// Out interactor protocol
protocol DetailOutputInteractorProtocol:class {
    func videoWith(URL url:String)
}

//MARK: - Router


/// WireFrame protocol
protocol DetailWireFrameProtocol: class {
  
}

