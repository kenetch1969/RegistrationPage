//
//  BasePresenter.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/7/19.
//  Copyright © 2019 technomotion. All rights reserved.
//

import Foundation


protocol BasePresenter {
    associatedtype View
    func attachView(delegate : View)
    func detachView()
    func destroy()
}
