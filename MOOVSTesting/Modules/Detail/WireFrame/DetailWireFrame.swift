//
//  DetailWireFrame.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/25/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Detail router
class DetailWireFrame: DetailWireFrameProtocol {
    
    
    
    /// Create detail module
    ///
    /// - Parameters:
    ///   - detailRef: Detail view
    ///   - media: Media selected
    public class func createDetailModule(detailRef:DetailViewController, media:MediaProtocol){
        let presenter:DetailPresenterProtocol & DetailOutputInteractorProtocol = DetailPresenter()
        (presenter as? DetailPresenter)!.media = media
        detailRef.presenter = presenter
        detailRef.presenter?.view = detailRef
        detailRef.presenter?.wireFrame = DetailWireFrame()
        detailRef.presenter?.interactor = DetailInteractor()
        detailRef.presenter?.interactor?.presenter = presenter
    }
    
}
