//
//  UserDefaults.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation


class UserDefaultsHelpers{
    init(){}
    
    func saveString(key:String, value:Any){
        UserDefaults.standard.set(value, forKey: key)
    }
    func retrieveData(key:String)->Any{
        return UserDefaults.standard.value(forKey: key)
    }
    
}

