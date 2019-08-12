//
//  UserDefaults.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation


class UserDefaultsHelpers{
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
