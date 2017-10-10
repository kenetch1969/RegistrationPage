//
//  ViewController.swift
//  TheRegistrationPage
//
//  Created by qiscus on 10/6/17.
//  Copyright © 2017 technomotion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var presenter: RegistrationPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RegistrationPresenter(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonRegisterDidTap(_ sender: Any) {
        self.presenter?.register(email: emailTextField.text!, password: passwordTextField.text!, fullName: fullNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }
}

extension ViewController: RegistrationDelegate{
    func showProgress(){
        
    }
    func hideProgress(){
        
    }
    func registrationDidSucceed(){
        print("succeed")
    }
    func registrationDidFailed(message: String){
        print(message)
    }
}
