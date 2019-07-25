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

class PresentationAssembly: Assembly {
    func assemble(container: Container) {
    }
}

extension SwinjectStoryboard {
    
    public static func setup() {
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
//            c.presenter = r.resolve(ViewController.self)
            //set here
        }

    }
    
}

