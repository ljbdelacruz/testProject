//
//  RealmHelpers.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import RealmSwift


public class RealmHelpers{
    public let realm = try! Realm()
    init(){
    }
    func saveObject(object:Object){
        try! realm.write {
            realm.add(object)
        }
    }
    
    
    //this will get the path to your realm file so you can access the file
    //to verify if the object you are saving is there
    func getRealmPath()->String{
        return Realm.Configuration.defaultConfiguration.fileURL!.absoluteString;
    }

    
}

