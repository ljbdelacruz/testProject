//
//  CLLRealmLJ.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import RealmSwift


class CLLRealmLJ{
    public let realm = try! Realm()
    var helper=RealmHelpers()
    init(){
    }
    //used when fetching localization
    func getValueByKey(key:String, langID:Int)->String{
        let list=realm.objects(CLLocalizationRealm.self);
        let results=list.filter({$0.langID == langID}).first
//        let results=realm.objects(CLLocalizationRealm.self).filter("key == "+key);
        return results!.value ?? ""
    }
    func getAll()->Results<CLLocalizationRealm>{
        let results=realm.objects(CLLocalizationRealm.self);
        return results;
    }
    //add by list
    func addByList(datas:[CLLJLocalization]){
        for i in 0 ..< datas.count {
            addData(data: datas[i]);
        }
    }
    func addData(data:CLLJLocalization){
        let temp=CLLocalizationRealm();
        temp.setValue(id: data.id!, key: data.key!, value: data.value!, langID: data.langID!)
        try! realm.write {
            realm.add(temp);
        }
    }
    func removeAll(){
        let results=realm.objects(CLLocalizationRealm.self);
        try! realm.write {
            realm.delete(results);
        }
    }
    
}



//MARK: Realm Models


class CLLocalizationRealm: Object {
    @objc dynamic var id:Int=0
    @objc dynamic var key:String?;
    @objc dynamic var value:String?;
    @objc dynamic var langID:Int=0;
    
    func setValue(id:Int, key:String, value:String, langID:Int){
        self.id=id;
        self.key=key;
        self.value=value;
        self.langID=langID;
    }
}
