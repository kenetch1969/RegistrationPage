//
//  TheRegistrationPageTests.swift
//  TheRegistrationPageTests
//
//  Created by qiscus on 10/6/17.
//  Copyright © 2017 technomotion. All rights reserved.
// https://www.raywenderlich.com/960290-ios-unit-testing-and-ui-testing-tutorial
// https://www.raywenderlich.com/1752-unit-testing-tutorial-mocking-objects
// https://medium.com/orbismobile/conociendo-stubs-y-mocks-30689161f8a3

import XCTest
@testable import TheRegistrationPage

class TheRegistrationPageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsertUser () {
        let item = ["email":"a@b.com", "password": "password01", "fullName": "Romero", "phone": "5566777" ]
        let persistencia = UserPersistence()
        persistencia.insert(item) { (result, message) in
            XCTAssertTrue(result)
        }
    }
    
    func testQueryUser() {
        let persistencia = UserPersistence()
        let predicate = NSPredicate(format: "email = %@", "a@a.com")
        persistencia.query(predicate: predicate) { (result) in
            XCTAssertNotNil(result)
        }
    }
    
    
    func testUpdateUser () {
        let item = ["email":"a@b.com", "password": "password01", "fullname": "Ramiro", "phone": "5566777" ]
        let persistencia = UserPersistence()
        let predicate = NSPredicate(format: "email = %@", "a@b.com")
        persistencia.query(predicate: predicate) { (result) in
            guard let user = result.first else { return }
            persistencia.update(item, update: user) { (result, message) in
                XCTAssertTrue(result)
            }
        }
    }
    
    func testDeleteUser () {
        let persistencia = UserPersistence()
        let predicate = NSPredicate(format: "email = %@", "a@l.com")
        persistencia.query(predicate: predicate) { (result) in
            guard let user = result.first else { return }
            persistencia.delete(delete: user) { (result, message) in
                XCTAssertTrue(result)
            }
        }
    }
    
    func testRegisterWithEmptyEmail(){
       let expec = expectation(description: "registration with empty email")
       let persistencia = UserPersistence()
       let presenter = RegistrationPresenter(model: persistencia)
       presenter.attachView(view: MockUIViewController1(expectation: expec))
       presenter.register(email: "", password: "123456789", fullName: "michel jhon", phoneNumber: "087654325673")
       wait(for: [expec], timeout: 3)
    }
}
    
//    func testRegisterWithEmptyEmail(){
//        let expec = expectation(description: "registration with empty email")
//        let persistencia = UserPersistence()
//        //let registrationPresenter = RegistrationPresenter(
//        //let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController1(expectation: expec))
//
//        registrationPresenter.register(email: "", password: "123456789", fullName: "michel jhon", phoneNumber: "087654325673")
//        wait(for: [expec], timeout: 3)
//    }
//
//    func testRegistrationWithEmptyPassword(){
//        let expec = expectation(description: "registration with empty password")
//        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController2(expectation: expec))
//        registrationPresenter.register(email: "siapa@email.com", password: "", fullName: "michel jhon", phoneNumber: "087654325673")
//        wait(for: [expec], timeout: 3)
//    }
//
//    func testRegistrationWithPasswordLessthan8Char(){
//        let expec = expectation(description: "registration with min password char is 8")
//        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController3(expectation: expec))
//        registrationPresenter.register(email: "siapa@email.com", password: "123", fullName: "michel jhon", phoneNumber: "087654325673")
//        wait(for: [expec], timeout: 3)
//    }
//
//    func testRegistrationWithEmptyFullName(){
//        let expec = expectation(description: "registration with empty fullname")
//        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController4(expectation: expec))
//        registrationPresenter.register(email: "siapa@email.com", password: "12345678", fullName: "", phoneNumber: "087654325673")
//        wait(for: [expec], timeout: 3)
//    }
//
//    func testRegistrationWithEmptyPhoneNumber(){
//        let expec = expectation(description: "registration with empty phone number")
//        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController5(expectation: expec))
//        registrationPresenter.register(email: "siapa@email.com", password: "12345678", fullName: "michel jhon", phoneNumber: "")
//        wait(for: [expec], timeout: 5)
//    }
//    func testRegisterWithAllFilled(){
//        let expec = expectation(description: "registration with empty phone number")
//        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController6(expectation: expec))
//        registrationPresenter.register(email: "siapa@email.com", password: "12345678", fullName: "michel jhon", phoneNumber: "087654325673")
//        wait(for: [expec], timeout: 3)    }
//}
//
class MockUIViewController1: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "email can't be blank")
        self.expec.fulfill()
    }
}
//class MockUIViewController2: RegistrationDelegate{
//    var expec: XCTestExpectation
//    init(expectation: XCTestExpectation) {
//        self.expec = expectation
//    }
//    func showProgress(){}
//    func hideProgress(){}
//    func registrationDidSucceed(){}
//    func registrationDidFailed(message: String){
//        XCTAssertEqual(message, "password can't be blank")
//        self.expec.fulfill()
//    }
//}
//class MockUIViewController3: RegistrationDelegate{
//    var expec: XCTestExpectation
//    init(expectation: XCTestExpectation) {
//        self.expec = expectation
//    }
//    func showProgress(){}
//    func hideProgress(){}
//    func registrationDidSucceed(){}
//    func registrationDidFailed(message: String){
//        XCTAssertEqual(message, "the minimum password length is 8 char")
//        self.expec.fulfill()
//    }
//}
//class MockUIViewController4: RegistrationDelegate{
//    var expec: XCTestExpectation
//    init(expectation: XCTestExpectation) {
//        self.expec = expectation
//    }
//    func showProgress(){}
//    func hideProgress(){}
//    func registrationDidSucceed(){}
//    func registrationDidFailed(message: String){
//        XCTAssertEqual(message, "full name can't be blank")
//        self.expec.fulfill()
//    }
//}
//class MockUIViewController5: RegistrationDelegate{
//    var expec: XCTestExpectation
//    init(expectation: XCTestExpectation) {
//        self.expec = expectation
//    }
//    func showProgress(){}
//    func hideProgress(){}
//    func registrationDidSucceed(){}
//    func registrationDidFailed(message: String){
//        XCTAssertEqual(message, "phone number can't be blank")
//        self.expec.fulfill()
//    }
//}
//
//class MockUIViewController6: RegistrationDelegate{
//    var expec: XCTestExpectation
//    init(expectation: XCTestExpectation) {
//        self.expec = expectation
//    }
//    func showProgress(){}
//    func hideProgress(){}
//    func registrationDidSucceed(){
//        XCTAssertTrue(true)
//        self.expec.fulfill()
//    }
//    func registrationDidFailed(message: String){}
//}
