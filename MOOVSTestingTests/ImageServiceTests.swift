//
//  ImageServiceTests.swift
//  MOOVSTestingTests
//
//  Created by Cesar Rioja G on 7/26/19.
//  Copyright © 2019 Cesar Rioja G. All rights reserved.
//

import XCTest
@testable import MOOVSTesting


/// Image service test
class ImageServiceTests: XCTestCase {

    
    var service: ImageServiceProtocol?
    
    override func setUp() {
        service = ServiceLocator.resolve()
    }

    func test_getImage_whenCalled_true(){
        XCTAssert(service?.get(identifier: String()) != nil)
    }

}
