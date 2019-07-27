//
//  ServiceLocator.swift
//  MOOVSTesting
//
//  Created by Cesar Rioja G on 7/6/19.
//  Copyright © 2019 Cesar Rioja G. All rights

#if TESTING
let useMocks:Bool = true
#else
/// Set mocks
let useMocks:Bool = false
#endif

import UIKit


/// Manage the services 
final class ServiceLocator : ServiceLocatorProtocol {
    
    
    /// Singleton instance
    public static let instance = ServiceLocator()
    
    
    /// Current services
    private static var services:Dictionary<String,Any> = [:]
    
    //MARK: - Private
    
    
    /// Register services
    static private func registerServices(){
        
        ServiceLocator.registerService(service: FileIOService() as FileIOServiceProtocol)
        ServiceLocator.registerService(service: AppConfiguration() as AppConfigurationProtocol)
        ServiceLocator.registerService(service: RestAPIService() as RestAPIServiceProtocol)
        
        //Rest Service
        ServiceLocator.registerService(service: MediaService() as MediaServiceProtocol)
        ServiceLocator.registerService(service: VideoAPIService() as VideoPIServiceProtocol)
        ServiceLocator.registerService(service: ImageService() as ImageServiceProtocol)
        
    }
    
    
    /// Register mocks
    static private func registerServicesMocks(){

        ServiceLocator.registerService(service: FileIOService() as FileIOServiceProtocol)
        ServiceLocator.registerService(service: AppConfigurationMock() as AppConfigurationProtocol)
        ServiceLocator.registerService(service: RestAPIService() as RestAPIServiceProtocol)
        ServiceLocator.registerService(service: MediaServiceMock() as MediaServiceProtocol)
        ServiceLocator.registerService(service: VideoAPIServiceMock() as VideoPIServiceProtocol)
        ServiceLocator.registerService(service: ImageServiceMock() as ImageServiceProtocol)
    }

    
    /// Logic for register a service
    ///
    /// - Parameter service: The service
    static private func registerService<T>(service: T) {
        print("Se guarda \(String(describing: T.self))")
        ServiceLocator.services[String(describing: T.self)] = service
    }
    
    //MARK: - Init
    
    /// Init class
    static func initValues() {
        if(useMocks){
            ServiceLocator.registerServicesMocks()
        }else{
            ServiceLocator.registerServices()
        }
        
    }
    
 
    //MARK: - Public
    
    
    /// Resolve the service
    ///
    /// - Returns: A service
    static func resolve<T>() -> T? {
        guard let service = ServiceLocator.services[String(describing: T.self)] else{
            fatalError("Fatal error: Service \(T.self) not implemented")
        }
        return service as? T
    }
    
}
