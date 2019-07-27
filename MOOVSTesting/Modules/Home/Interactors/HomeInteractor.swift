//
//  HomeInteractor.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Home interactor
class HomeInteractor: HomeInputInteractorProtocol {
    
    // MARK: - Properties

    
    /// Media list
    var mediaList:[MediaProtocol] = [MediaProtocol]()
    
    /// Presenter
    weak var presenter: HomeOutputInteractorProtocol?
    
    //MARK: - Required

    
    /// Service to get media
    var mediaService: MediaServiceProtocol?
    
    //MARK: - Private

    
    /// Get media
    private func getMedia(){
        presenter?.mediaListFetched(mediaList: mediaList)
    }

    
    /// Apply filters
    ///
    /// - Parameters:
    ///   - media: Media type
    ///   - category: Media category
    private func applyFilter(media:MediaType, category:MediaCategory){
        self.mediaList = self.mediaList.filter({$0.type == media})
        presenter?.mediaListFetched(mediaList: self.mediaList)
    }
    
    
    /// Get media from Server
    private func GetFromService(type: MediaType, category: MediaCategory){
        let request:MediaRequest = {
            let _request = MediaRequest()
            _request.category = category
            _request.type = type
            return _request
        }()

        mediaService?.getMediaList(request: request, completion: { (safeResponse) in
            DispatchQueue.main.async {
                if let data = safeResponse.data, safeResponse.code == Int(){
                    self.mediaList = data
                    self.applyFilter(media: type, category: category)
                }
            }
        })
    }
    
    //MARK: - Init
    
    
    /// Init clss
    init() {
        guard let service:MediaServiceProtocol = ServiceLocator.resolve() else {
            return
        }
        mediaService = service
    }
    
    
    //MARK: - Public

    
    /// Get media
    ///
    /// - Parameters:
    ///   - type: Media type
    ///   - category: Media category
    func getMediaList(type: MediaType, category: MediaCategory) {
        GetFromService(type: type, category: category)
    }
    

}
