//
//  ViewController.swift
//  TheRegistrationPage
//
//  Created by qiscus on 10/6/17.
//  Copyright © 2017 technomotion. All rights reserved.
// Para validar un password
// https://medium.com/jen-hamilton/swift-4-password-validation-helper-methods-f98a7ea5dcbb

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var testSegmented: UISegmentedControl!
    
    
    
    @IBOutlet weak var activityIndicatorRegister: UIActivityIndicatorView!
    
    var presenter: RegistrationPresenter?
    
//    init(with presenter: RegistrationPresenter) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.presenter = RegistrationPresenter(delegate: self)
        self.testSegmented.selectedSegmentIndex = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonRegisterDidTap(_ sender: Any) {
        self.presenter?.register(email: emailTextField.text!, password: passwordTextField.text!, fullName: fullNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }
    
    
    @IBAction func testSegmentedValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
              self.performSegue(withIdentifier: "segueShowRegister", sender: self)
        case 1:
              self.performSegue(withIdentifier: "segueShowRegisterManual", sender: self)
        case 2:
            self.performSegue(withIdentifier: "segueContacts", sender: self)
            break
        default:
            break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowRegister" {
            guard let viewShowRegister = segue.destination as? ShowRegisterTableViewController else { return }
            let persistencia = UserPersistence()
            let presenter = ShowPresenter(model: persistencia)
            presenter.attachView(delegate: viewShowRegister)
            viewShowRegister.presenter = presenter
            
        }
        
        if segue.identifier == "segueShowRegisterManual" {
            guard let viewShowRegister = segue.destination as? ShowRegisterViewController else { return }
            let persistencia = UserPersistence()
            let presenter = ShowPresenter(model: persistencia)
            presenter.attachView(delegate: viewShowRegister)
            viewShowRegister.presenter = presenter 
            
        }
    }
}

extension ViewController: RegistrationDelegate{
    func showProgress(){
        activityIndicatorRegister.isHidden = true
        activityIndicatorRegister.startAnimating()
    }
    func hideProgress(){
        activityIndicatorRegister.stopAnimating()
    }
    func registrationDidSucceed(){
        self.performSegue(withIdentifier: "segueShowRegister", sender: self)
    }
    func registrationDidFailed(message: String){
        let alert = UIAlertController(title: "Register", message: message, preferredStyle: .alert)
        let accept = UIAlertAction(title: "Aceptar", style: .cancel)
        
        alert.addAction(accept)
        self.present(alert, animated: true)
    }
}
