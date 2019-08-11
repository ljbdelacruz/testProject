//
//  UserDefaults.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation


class UserDefaultsHelpers{
<<<<<<< HEAD
    init(){}
    
    func saveString(key:String, value:Any){
        UserDefaults.standard.set(value, forKey: key)
    }
    func retrieveData(key:String)->Any{
        return UserDefaults.standard.value(forKey: key)
    }
    
}

=======
    
    init(){
    }
    func setData(value:String, key:String){
        UserDefaults.standard.set(value, forKey: key);
    }
    func readData(key:String)->String{
        return UserDefaults.standard.string(forKey: key) ?? "";
    }
    func clearData(){
        
    }
    
}
>>>>>>> 71ed3e518d44b8545ff61f82b5cc0e72f0830152
