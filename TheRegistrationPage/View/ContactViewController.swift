//
//  ContactViewController.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/11/19.
//  Copyright © 2019 inventaapps. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    private let contacts = ContactAPI.getContacts()
    private let contactsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(contactsTableView)
    contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
//        contactsTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        contactsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        contactsTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
//        contactsTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        ;contactsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contactsTableView.dataSource = self
        
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        contactsTableView.rowHeight = 100
    
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

//Datos
extension ContactViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        cell.contact = contacts[indexPath.row]
        
        return cell
    }
    
}
 
//Comportamiento
extension ContactViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
 
