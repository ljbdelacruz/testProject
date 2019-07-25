//
//  AppAssembler.swift
//  testProject
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import BaseCodeAPI

class AppAssembler {
    
    static let instance = AppAssembler()
    let assembler = try! Assembler(assemblies: [
        DataAssembly.instance,
        PresentationAssembly()
        ], container: SwinjectStoryboard.defaultContainer)
}

extension AppAssembler {
    func initialViewController() -> ViewController {
        let sb = SwinjectStoryboard.create(name: "Main", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! ViewController
        return vc
    }
}

extension UIViewController {
    var assembler: AppAssembler { return AppAssembler.instance }
}
