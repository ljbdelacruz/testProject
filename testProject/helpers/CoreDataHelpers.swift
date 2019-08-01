//
//  CoreDataHelpers.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelpers{
    var context:NSPersistentContainer?;
    public init(context:NSPersistentContainer){
        self.context=context;
    }
    //MARK: saving access
    public func setTableEntity(table:String)->NSManagedObject{
        let entity = NSEntityDescription.entity(forEntityName: table,
                                       in: context!.viewContext)!
        let table = NSManagedObject(entity: entity,
                                    insertInto: context!.viewContext);
        return table;
    }
    public func addProperties(table:NSManagedObject, key:String, value:Any){
        table.setValue(value, forKey: key);
    }
    public func saveContext()->(Bool, Error?){
        do {
            try context?.viewContext.save()
            return (true, nil);
        } catch let error as NSError {
            return (false, error);
        }
    }
        
    //MARK: getting access on coredata
    public func fetchRequestTable(table:String)->(Bool, [NSManagedObject]?){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: table);
        do {
            let data=try context?.viewContext.fetch(fetchRequest)
            return (true, data);
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return (false, []);
        }
    }
    
}
