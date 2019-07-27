//
//  DetailInteractor.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Detail interactor
class DetailInteractor: DetailInputInteractorProtocol {
    
    
    /// Presenter
    weak var presenter: DetailOutputInteractorProtocol?
    
    
    /// Media objcet
    var media:MediaProtocol?
    
    //MARK: - Required
    
    
    /// Video service
    private var videoAPIService:VideoPIServiceProtocol?
    
    
    //MARK: - Init
    
    
    /// Init class
    init() {
        self.videoAPIService = ServiceLocator.resolve()
    }
    
    
    
    /// Get video from VideoService
    ///
    /// - Parameter video: Video identifier
    func getVideo(video:Int) {
        let request:VideoRequest = {
            let _video = VideoRequest()
            _video.identifier = video
           return _video
        }()
        videoAPIService?.getVideo(request: request, completation: { (movieVideo) in
            if let video = movieVideo, let key = video.key{
                self.presenter?.videoWith(URL: key)
            }
        })
    }
    
    
}
