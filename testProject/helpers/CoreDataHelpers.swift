//
//  CoreDataHelpers.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import CoreData


protocol  CoreDataHelpersProtocol {
    func successSave();
    func errorSave();
}

class CoreDataHelpers{
    var context:NSPersistentContainer?;
    var myprotocol:CoreDataHelpersProtocol?;
    init(){
    }
    public convenience init(context:NSPersistentContainer){
        self.init();
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
    public func saveContext(){
        do {
            try context?.viewContext.save()
            myprotocol?.successSave();
        } catch let error as NSError {
            myprotocol?.errorSave();
        }
    }
    //MARK: getting access on coredata
    public func fetchRequestTable(table:String)->Any{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: table);
        do {
            return try context!.viewContext.fetch(fetchRequest)
        } catch let error as NSError {
            return error;
        }
    }
    public func getCoreDataPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        return paths[0];
    }
    
}


//MARK: Examples

extension CoreDataHelpers{
    func exampleSave(){
        let category=self.setTableEntity(table: "Category")
        category.setValue(10, forKey: "parent")
        category.setValue(0, forKey: "id")
        category.setValue("test10", forKey: "name");
        self.saveContext();
    }
    func exampleRead(){
        let data=self.fetchRequestTable(table: "Category") as! [Category];
        let objectToDelete=data[0] as! NSManagedObject;
        print(data.count);
    }
    func exampleDelete(){
        var data=self.fetchRequestTable(table: "Category") as! [Category];
        let toDeleteObject=data[0] as! NSManagedObject
        self.context!.viewContext.delete(toDeleteObject);
        self.saveContext();
    }
    func exampleUpdate(){
        var data=self.fetchRequestTable(table: "Category") as! [Category];
        data[0].parent=2;
        self.saveContext();
    }
    
}


