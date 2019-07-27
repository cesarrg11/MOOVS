//
//  RestAPIService.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/7/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import UIKit



/// Rest API Service implementation
class RestAPIService: RestAPIServiceProtocol {
    
    
    /// Execute request
    ///
    /// - Parameters:
    ///   - url: URL request
    ///   - method: HTTP Method
    ///   - obj: Request object
    ///   - completion: Completation handler
    fileprivate func execute<X,Y>(url:String,method:RestMethod,obj:X,completion:@escaping (Y)->()) where X : RestRequest, Y : RestResponse  {
        
        let result:RestResponse = {
            let base = RestResponse()
            base.code = 1
            return base
        }()
        
        do{
            var urlRequest = URLRequest(url: URL(string: url)!)
            urlRequest.httpMethod = method.rawValue
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                print("URL: \(urlRequest) \n Response:\(String(describing: response)) \n Data:\(String(describing: String(data: data ?? Data(), encoding: .utf8)))")
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    let jsonData = data else{
                        completion((result as? Y)!)
                        print("Error obtener datos")
                        return
                }
                
                do{
                    result.data = jsonData
                }
                result.code = Int()
                completion((result as? Y)!)
                
            }
            dataTask.resume()
            
        }
    }
    
    /// Request
    ///
    /// - Parameters:
    ///   - method: HTTP Method
    ///   - obj: Request object
    ///   - endpoint: Endpoint
    ///   - urlParameter: URL parameters
    ///   - completion: Completation handlre
    func request<X, Y>(method: RestMethod, obj: X, endpoint: String, urlParameter: [String : String]?, completion: @escaping (Y) -> ()) where X : RestRequest, Y : RestResponse {
        
        var url:String = endpoint
        if let parameters = urlParameter{
            url += "?"
            for (key, value) in parameters{
                url += "\(key)=\(value)&"
            }
            url.removeLast()
        }
        execute(url: url, method: method, obj: obj) { (response:RestResponse) in
            completion((response as? Y)!)
        }
    }
    

}
