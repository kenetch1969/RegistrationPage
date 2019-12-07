//
//  RegistrationPresenter.swift
//  TheRegistrationPage
//
//  Created by qiscus on 10/6/17.
//  Copyright © 2017 technomotion. All rights reserved.
//

import Foundation

protocol RegistrationDelegate{
    func showProgress()
    func hideProgress()
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class RegistrationPresenter: BasePresenter {
    typealias View = RegistrationDelegate
    var delegate: RegistrationDelegate?
    var model: Persistences 
    
    init (model: Persistences) {
        self.model = model
    }
    
    func attachView(view : View){
        self.delegate = view
    }
    
    func detachView(){
        self.delegate = nil
    }
    
    func destroy() {
        
    }
    
//    init(delegate: RegistrationDelegate) {
//        self.delegate = delegate
//    }
    
    func register(email: String, password: String, fullName: String, phoneNumber:String){
        if email.isEmpty{
            print("omayib")
            self.delegate?.registrationDidFailed(message: "email can't be blank")
            return
        }
        if password.isEmpty{
            self.delegate?.registrationDidFailed(message: "password can't be blank")
            return
        }
        
        if (password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil) {
            self.delegate?.registrationDidFailed(message: "one upper case letter")
            return
        }
        if (password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil) {
            self.delegate?.registrationDidFailed(message: "one lower case letter")
            return
        }
        if (password.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
            self.delegate?.registrationDidFailed(message: "one number")
            return
        }
        if password.count < 8 {
            self.delegate?.registrationDidFailed(message: "the minimum password length is 8 char")
            return
        }
        if fullName.isEmpty{
            self.delegate?.registrationDidFailed(message: "full name can't be blank")
            return
        }
        if phoneNumber.isEmpty{
            self.delegate?.registrationDidFailed(message: "phone number can't be blank")
            return
        }
        self.delegate?.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            let item = ["email":email, "password": password, "fullName": fullName, "phone": phoneNumber ]
            
            self.model.insert(item) { (response, message) in
                self.delegate?.hideProgress()
                if response {
                  self.delegate?.registrationDidSucceed()
                } else {
                  self.delegate?.registrationDidFailed(message: message)
                }
            }
        }
    }
    
    public func validatePassword(password: String) -> Bool {
       //Minimum 8 characters at least 1 Alphabet and 1 Number:
       let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
       let trimmedString = password.trimmingCharacters(in: .whitespaces)
       let validatePassword = NSPredicate(format:"SELF MATCHES %@", passRegEx)
       let isvalidatePass = validatePassword.evaluate(with: trimmedString)
       return isvalidatePass
    }
    
}
