//
//  BaseView.swift
//  testProject
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//
import Foundation

protocol BaseView: class {

}

class BasePresenter {
    
    weak var view: BaseView?
    
    func attachView(view: BaseView) {
        self.view = view
    }
    
    // no need to call this
    // since view has a weak reference
    func detachView() {
        self.view = nil
    }
    
}
