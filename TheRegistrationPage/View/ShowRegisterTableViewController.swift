//
//  ShowRegisterTableViewController.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/7/19.
//  Copyright © 2019 inventaapps. All rights reserved.
//

import UIKit
import CoreData

class ShowRegisterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
}

class ShowRegisterTableViewController: UITableViewController {
    
    private var users = [NSManagedObject]()
    var presenter: ShowPresenter?
    
    private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        indicator.style = .whiteLarge
        indicator.color = .darkGray
        indicator.hidesWhenStopped = true
        return indicator
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        self.presenter?.showUser()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ShowRegisterTableViewCell

        // Configure the cell...
        let user = users[indexPath.row]
        
        cell.emailLabel.text = "Email: \(user.value(forKey: "email") as? String ?? "")"
        cell.fullNameLabel.text = "FullName: \(user.value(forKey: "fullname") as? String ?? "")"
        cell.phoneLabel.text = "Phone: \(user.value(forKey: "phone") as? String ?? "")"
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShowRegisterTableViewController: ShowDelegate {
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
