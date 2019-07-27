//
//  MediaService.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Media service
class MediaService: MediaServiceProtocol {
    
    //MARK: - Properties
    
    ///Popular list media
    var popular:[MediaProtocol]?
    
    ///Top rated list media
    var topRatedMedia:[MediaProtocol]?
    
    /// UpComing list media
    var upcomingMedia:[MediaProtocol]?
    
    //MARK: - Required
    
    
    /// Rest service
    private var restAPIService: RestAPIServiceProtocol?
    
    //MARK: - Private
    
    /// Main manager
    ///
    /// - Parameters:
    ///   - type: Type of media
    ///   - category: Category of media
    ///   - completion: Completion task
    private func getMedia(request:MediaRequest,completion:@escaping([MediaProtocol])->()){
        let selectedMedia:[MediaProtocol]? = self.getList(category: request.category!)
        guard let media = selectedMedia, media.filter({$0.type == request.type}).count > Int() else {
            self.getMediaCache(request: request) { (_media) in
                 completion(_media)
            }
            return
        }
        completion(media)
    }

    
    /// Get media from cache
    ///
    /// - Parameter completion: Completion taks
    private func  getMediaCache(request: MediaRequest,completion:@escaping([MediaProtocol])->()) {
        guard let cached:[MediaProtocol] =  Cache.getObject(key: "LIST_\(request.category!)_\(request.type!)") as? [MediaProtocol] , cached.count > Int() else{
            self.getMediaRemote(request: request) { (media) in
                Cache.saveObject(object: media as AnyObject, key: "LIST_\(request.category!)_\(request.type!)")
                self.setList(category: request.category!, media: media)
                completion(media)
            }
            return
        }
        completion(cached)
    }
    
    
    /// Get media from web service
    ///
    /// - Parameters:
    ///   - request: Media request
    ///   - completion: Completion task
    private func getMediaRemote(request: MediaRequest,completion:@escaping([MediaProtocol])->()){
        let method:String = "\(request.type!.rawValue)/\(request.category!.rawValue)"
        let url:String = "\(String(describing: (Utils.getAppProperties()?.theMovieDBEndpoint)!))"
        let parameters:[String:String] = [
            "api_key":(Utils.getAppProperties()?.theMovieDBAPIKey)!,
            "language": Locale.current.languageCode!.lowercased()
        ]
        restAPIService?.request(method: .get, obj: request, endpoint: "\(url)\(method)", urlParameter: parameters, completion: { (response:RestResponse) in
            
            if(response.code == Int()){
                
                if request.type == .movie{
                    guard
                        let data = response.data ,
                        let mediaResponse = try? JSONDecoder().decode(MediaResponse<MovieMedia>.self, from: data),
                        let _list = mediaResponse.mediaList else {
                            
                            completion([MovieMedia]())
                            return
                    }
                    
                    let list = _list.map({ (item:MovieMedia) -> MovieMedia in
                        var aux = item
                        aux.type = request.type
                        return aux
                    })
                    
                    completion(list)
                }else{
                    
                    guard
                        let data = response.data ,
                        let mediaResponse = try? JSONDecoder().decode(MediaResponse<TVShowMedia>.self, from: data),
                        let _list = mediaResponse.mediaList else {
                            
                            completion([TVShowMedia]())
                            return
                    }
                    
                    let list = _list.map({ (item:TVShowMedia) -> TVShowMedia in
                        var aux = item
                        aux.type = request.type
                        return aux
                    })
                    
                    completion(list)
                }
                
                
            }else{
                completion(request.type == .movie ? [MovieMedia]() : [TVShowMedia]())
            }
        })
    }
    
    //MARK: - Init
    
    
    /// Init class
    init() {
        restAPIService = ServiceLocator.resolve()
    }
    
    
    //MARK: - Public
    
    /// Get media list
    ///
    /// - Parameters:
    ///   - request: Request
    ///   - completion: Completion task
    public func getMediaList(request: MediaRequest, completion: @escaping (SafeResponse<[MediaProtocol]>) -> ()){
        
        self.getMedia(request: request) { (media) in
            let result:SafeResponse<[MediaProtocol]> = {
                let safe = SafeResponse<[MediaProtocol]>()
                safe.code = Int()
                safe.data = media
                return safe
            }()
            completion(result)
        }
        
        
    }
    

}

