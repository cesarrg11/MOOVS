//
//  MediaServiceMock.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit


/// Media service mock
class MediaServiceMock: MediaServiceProtocol {
    
    

    /// Mock
    ///
    /// - Parameter request: mock
    /// - Returns: mock
    func getMediaList(request: MediaRequest, completion: @escaping (SafeResponse<[MediaProtocol]>) -> ()){
        
        let result = SafeResponse<[MediaProtocol]>()
        result.code = Int()
        result.data = [MediaProtocol]()
        
        var json = String()
        if request.type == .movie {

            switch request.category! {
                case .popular:
                    json = MediaResponsesMock.moviesPopularResponse
                    break
                
                case .topRated:
                    json = MediaResponsesMock.moviesTpRatedResponse
                    break
                
                case .upcoming:
                    json = MediaResponsesMock.moviesUpcomingRespose
                    break
            }
            
            
            if let data = try? JSONDecoder().decode(MediaResponse<MovieMedia>.self, from: json.data(using: .utf8)!){
                
                let list = data.mediaList?.map({ (item:MovieMedia) -> MovieMedia in
                    var aux = item
                    aux.type = request.type
                    return aux
                })
                for i in list! {
                    result.data?.append(i)
                }
                
            }
        }else{
            
            switch request.category! {
                case .popular:
                    json = MediaResponsesMock.tvPopularResponse
                    break
                
                case .topRated:
                    json = MediaResponsesMock.tvTopRatedResponse
                    break
                case .upcoming:
                    json = String()
                    break
            }
            
            if let data = try? JSONDecoder().decode(MediaResponse<TVShowMedia>.self, from: json.data(using: .utf8)!){
                
                let list = data.mediaList?.map({ (item:TVShowMedia) -> TVShowMedia in
                    var aux = item
                    aux.type = request.type
                    return aux
                })
                for i in list!{
                    result.data?.append(i)
                }
                
            }
        }
        
        completion(result)
    }
    
    

}
