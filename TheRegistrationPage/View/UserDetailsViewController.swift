//
//  UserDetailsViewController.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/7/19.
//  Copyright © 2019 inventaapps. All rights reserved.
//

import UIKit
import CoreData

class UserDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var user: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let usr = user else { return }
        
        self.emailTextField.text = usr.value(forKey: "email") as? String ?? ""
        self.passwordTextField.text = usr.value(forKey: "password") as? String ?? ""
        self.fullNameTextField.text = usr.value(forKey: "fullname") as? String ?? ""
        self.phoneTextField.text = usr.value(forKey: "phone") as? String ?? ""
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
