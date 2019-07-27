//
//  MediaServiceTests.swift
//  MOOVSTestingTests
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import XCTest
@testable import MOOVSTesting


/// Media service test
class MediaServiceTests: XCTestCase {

    
    var mediaService:MediaServiceProtocol?
    
    override func setUp() {
        self.mediaService = ServiceLocator.resolve()
    }

    
    func test_getMoviesPupular_WhenCalled_True(){
        let request = MediaRequest()
        request.category = .popular
        request.type = .movie
        self.mediaService?.getMediaList(request: request, completion: { (safeRepsonse) in
            XCTAssert(safeRepsonse.code == Int() && safeRepsonse.data!.count > Int())
        })
    }
    
    func test_getMoviesTopRated_WhenCalled_True(){
        let request = MediaRequest()
        request.category = .topRated
        request.type = .movie
        self.mediaService?.getMediaList(request: request, completion: { (safeRepsonse) in
            XCTAssert(safeRepsonse.code == Int() && safeRepsonse.data!.count > Int())
        })
    }
    
    func test_getMoviesUpcoming_WhenCalled_True(){
        let request = MediaRequest()
        request.category = .upcoming
        request.type = .movie
        self.mediaService?.getMediaList(request: request, completion: { (safeRepsonse) in
            XCTAssert(safeRepsonse.code == Int() && safeRepsonse.data!.count > Int())
        })
    }
    
    func test_getTVPupular_WhenCalled_True(){
        let request = MediaRequest()
        request.category = .popular
        request.type = .tvShow
        self.mediaService?.getMediaList(request: request, completion: { (safeRepsonse) in
            XCTAssert(safeRepsonse.code == Int() && safeRepsonse.data!.count > Int())
        })
    }
    
    func test_gettvTopRated_WhenCalled_True(){
        let request = MediaRequest()
        request.category = .topRated
        request.type = .tvShow
        self.mediaService?.getMediaList(request: request, completion: { (safeRepsonse) in
            XCTAssert(safeRepsonse.code == Int() && safeRepsonse.data!.count > Int() )
        })
    }
    

}
