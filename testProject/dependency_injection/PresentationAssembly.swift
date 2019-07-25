//
//  PresentationAssembly.swift
//  testProject
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration
import BaseCodeAPI

class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MainPresenter.self, initializer: MainPresenter.init)
    }
}

extension SwinjectStoryboard {
    
    public static func setup() {
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
            c.presenter = r.resolve(MainPresenter.self)
            //set here
        }

    }
    
}

