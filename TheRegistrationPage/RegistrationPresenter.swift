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

class RegistrationPresenter{
    var delegate: RegistrationDelegate
    
    init(delegate: RegistrationDelegate) {
        self.delegate = delegate
    }
    
    func register(email: String, password: String, fullName: String, phoneNumber:String){
        if email.isEmpty{
            print("omayib")
            self.delegate.registrationDidFailed(message: "email can't be blank")
            return
        }
        if password.isEmpty{
            self.delegate.registrationDidFailed(message: "password can't be blank")
            return
        }
        if password.characters.count < 8 {
            self.delegate.registrationDidFailed(message: "the minimum password length is 8 char")
            return
        }
        if fullName.isEmpty{
            self.delegate.registrationDidFailed(message: "full name can't be blank")
            return
        }
        if phoneNumber.isEmpty{
            self.delegate.registrationDidFailed(message: "phone number can't be blank")
            return
        }
        self.delegate.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.delegate.hideProgress()
            self.delegate.registrationDidSucceed()
        }
    }
    
}
