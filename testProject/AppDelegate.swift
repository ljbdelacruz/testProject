//
//  AppDelegate.swift
//  testProject
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import BaseCodeAPI
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let assembler = AppAssembler.instance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Constants.baseURL="http://192.168.88.23:8080";
        self.initIQKeyboardManager();
//        self.initWindow();
        return true
    }
    func initIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = assembler.initialViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

    

}

