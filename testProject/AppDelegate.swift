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
import CoreData

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

    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataEntity")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

}



//MARK - Core Data
extension AppDelegate{
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


