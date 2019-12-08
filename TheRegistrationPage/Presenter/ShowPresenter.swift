//
//  ShowPresenter.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/7/19.
//  Copyright © 2019 technomotion. All rights reserved.
//

import Foundation
import CoreData

protocol ShowDelegate{
    func showProgress()
    func hideProgress()
    func setUsers(_ users: [NSManagedObject])
}

class ShowPresenter: BasePresenter {
    typealias View = ShowDelegate
    private var delegate: ShowDelegate?
    private var model: Persistences
    
    init(model: Persistences) {
        self.model = model
    }
    
    func attachView(delegate: ShowDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func destroy() {
        
    }
    
    func showUser(){
       self.delegate?.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.model.queryALL { (users) in
                  self.delegate?.hideProgress()
                  self.delegate?.setUsers(users)
            }
        }
    }
}
