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



//MARK: sample Implementation for Realm
extension RealmHelpers{
    func sampleImplementationsAdd(){
        let category=CategoryRModel();
        category.setValue(id: 1, name: "House", parent: "0")
        try! realm.write {
            realm.add(category);
        }
    }
    func sampleImplementationRead(){
        //retrieves data with filter
        let results=realm.objects(CategoryRModel.self).filter("name == 'House'");
        print(results.count);
        //retrieves all without filter
        //        let results=realm.objects(CategoryRModel.self);
    }
    func sampleImplementationUpdate(){
        let results=realm.objects(CategoryRModel.self).filter("name == 'House'");
        try! realm.write {
            results[0].parent = "2";
        }
    }
    func sampleImplementationRemove(){
        let results=realm.objects(CategoryRModel.self).filter("name == 'House'");
        try! realm.write {
            //if you want to delete by each element
            realm.delete(results[0]);
            //if you want to delete by list
            realm.delete(results);
        }
    }
}

