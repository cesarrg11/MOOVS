//
//  DetailPresenter.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/25/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Detail presenter
class DetailPresenter: DetailPresenterProtocol {
    
    
    /// Detail view
    var view: DetailViewProtocol?
    
    
    /// Router
    var wireFrame: DetailWireFrameProtocol?
    
    
    /// Selected media
    var media:MediaProtocol?
    
    /// Interactor
    var interactor:DetailInputInteractorProtocol?
    
    
    
    /// View did load
    func viewDidLoad() {
        view?.showMedia(media!)
        if media!.type == .movie{
            interactor?.getVideo(video: media!.identifier ?? Int())
        }
    }


}


// MARK: - DetailOutputInteractorProtocol

/// DetailOutputInteractorProtocol implemetation
extension DetailPresenter:DetailOutputInteractorProtocol{
    func videoWith(URL url: String) {
        view?.showVideo(video: url)
    }
}
