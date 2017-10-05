//
//  TheRegistrationPageTests.swift
//  TheRegistrationPageTests
//
//  Created by qiscus on 10/6/17.
//  Copyright © 2017 technomotion. All rights reserved.
//

import XCTest
@testable import TheRegistrationPage

class TheRegistrationPageTests: XCTestCase {
    
    var registrationPresenter: RegistrationPresenter?
    
    override func setUp() {
        super.setUp()
        self.registrationPresenter = RegistrationPresenter(delegate: self)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegisterWithAllFilled(){
        XCTFail()
    }
    
    func testRegisterWithEmptyEmail(){
        XCTFail()
    }
    
    func testRegistrationWithEmptyPassword(){
        XCTFail()
    }
    
    func testRegistrationWithEmptyAge(){
        XCTFail()
    }
    
    func testRegistrationWithEmptyPhoneNumber(){
        XCTFail()
    }
    
    
}
