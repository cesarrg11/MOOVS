//
//  VideoPIService.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// VideoAPIService implementation
class VideoAPIService: VideoPIServiceProtocol {
    
    
    //MARK: Required
    
    
    /// Service for rest request
    private var restAPIService: RestAPIServiceProtocol?
    
    
    /// Init class
    init() {
        self.restAPIService = ServiceLocator.resolve()
    }
    
    
    
    /// Get video
    ///
    /// - Parameters:
    ///   - request: Video request
    ///   - completation: Completion handler
    func getVideo(request: VideoRequest, completation: @escaping (MovieVideo?) -> ()) {
        let method = "\(MediaType.movie.rawValue)/\(request.identifier!)/\((Utils.getAppProperties()?.videosEndpoint)!)"
        let url = "\((Utils.getAppProperties()?.theMovieDBEndpoint)!)\(method)"
        let parameters:[String:String] = [
            "api_key":(Utils.getAppProperties()?.theMovieDBAPIKey)!,
            "language": Locale.current.languageCode!.lowercased()
        ]
        restAPIService?.request(method: .get, obj: request, endpoint: url, urlParameter: parameters, completion: { (response:RestResponse) in
             if response.code == Int(){
                guard
                    let data = response.data,
                    let videoResponse = try? JSONDecoder().decode(VideoResponse.self, from: data),
                    let results = videoResponse.results,
                    results.count > Int(),
                    results[Int()].site?.lowercased() == "youtube" else{
                        completation(nil)
                        return
                }
                completation(results[Int()])
                
                
            }
        })
    }
    
    
}
