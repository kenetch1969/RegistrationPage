//
//  ShowRegisterViewController.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/7/19.
//  Copyright © 2019 inventaapps. All rights reserved.
//

import UIKit
import CoreData

class ShowRegisterManualTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

}

class ShowRegisterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var users = [NSManagedObject]()
    var presenter: ShowPresenter?
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        indicator.style = .whiteLarge
        indicator.color = .darkGray
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Solo programaticamente no con storyboard
        //tableView.register(ShowRegisterManualTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        self.tableView.rowHeight = 121;
        self.presenter?.showUser()
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

extension ShowRegisterViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowRegisterManualTableViewCell
        
        let user = users[indexPath.row]
        
        cell.emailLabel.text = "Email: \(user.value(forKey: "email") as? String ?? "")"
        cell.fullnameLabel.text = "FullName: \(user.value(forKey: "fullname") as? String ?? "")"
        cell.phoneLabel.text = "Phone: \(user.value(forKey: "phone") as? String ?? "")"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueUserDetails" {
            if let detailVC = segue.destination as? UserDetailsViewController,
               let row = self.tableView.indexPathForSelectedRow?.row  {
                detailVC.user = users[row]
            }
        }
    }
}

extension ShowRegisterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueUserDetails", sender: self)
    }
    
}

extension ShowRegisterViewController: ShowDelegate {
    
    func showProgress() {
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = .white
    }
    
    func hideProgress() {
        activityIndicator.stopAnimating()
    }
    
    func setUsers(_ users: [NSManagedObject]) {
        self.users = users
        self.tableView.reloadData()
    }
    
}

