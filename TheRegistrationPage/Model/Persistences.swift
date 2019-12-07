//
//  Persistences.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/6/19.
//  Copyright © 2019 technomotion. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol Persistences {
    
    typealias fetchResponse = ([NSManagedObject])->()
    typealias response = (Bool, String) -> ()
    var appDelegate: AppDelegate { get set }
    var managerContext: NSManagedObjectContext { get set }
    
    init()
    
    func insert(_ item: Dictionary<String, Any>, completion: response)
    func update(_ item: Dictionary<String, Any>, update: NSManagedObject, completion: response)
    func delete(delete: NSManagedObject, completion: response)
    func queryALL(completion: fetchResponse)
    func query(predicate: NSPredicate, completion: fetchResponse)
}

extension Persistences {
    func save(completion: response) {
        do {
            try self.managerContext.save()
            completion(true, "Success")
        } catch let error as NSError? {
            completion(false, error?.userInfo.description ?? "Failure")
        }
    }
}

class UserPersistence: Persistences {
    
    //static var shared = Persistence()
    
    var appDelegate: AppDelegate
    var managerContext: NSManagedObjectContext
    
    required init(){
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managerContext = appDelegate.persistentContainer.viewContext
    }
    
    
    func insert(_ item: Dictionary<String, Any>, completion: response) {
        let user = Users(context: self.managerContext)
        
        user.email = item["email"] as? String ?? ""
        user.password = item["password"] as? String ?? ""
        user.fullname = item["fullname"] as? String ?? ""
        user.phone =  item["phone"] as? String ?? ""
        
        save { (result, message) in
            completion(result,message)
        }
    }
    
    func update(_ item: Dictionary<String, Any>, update: NSManagedObject, completion: response) {
        update.setValue(item["email"] as? String ?? "", forKey: "email")
        update.setValue(item["password"] as? String ?? "", forKey: "password")
        update.setValue(item["fullname"] as? String ?? "", forKey: "fullname")
        update.setValue(item["phone"] as? String ?? "", forKey: "phone")
        
        save { (result, message) in
            completion(result,message)
        }
    }
    
    func delete(delete: NSManagedObject, completion: response) {
        managerContext.delete(delete)
        save { (result, message) in
            completion(result,message)
        }
    }
    
    func queryALL(completion: fetchResponse) {
        let user : NSFetchRequest<Users> = Users.fetchRequest()
        do {
            let fetchResult = try managerContext.fetch(user)
            completion(fetchResult)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func query(predicate: NSPredicate, completion: fetchResponse) {
        let user : NSFetchRequest<Users> = Users.fetchRequest()
        user.predicate = predicate
        do {
            let fetchResult = try managerContext.fetch(user)
            completion(fetchResult)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
