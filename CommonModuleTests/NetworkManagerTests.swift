//
//  NetworkManagerTests.swift
//  CommonModuleTests
//
//  Created by Admin on 8/5/21.
//

@testable import CommonModule
import XCTest

class NetworkManagerTests: XCTestCase {
        
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testToken() {
        let manager = NetworkManager()        
        XCTAssertNoThrow(manager.setToken(token: ""))
    }

}
