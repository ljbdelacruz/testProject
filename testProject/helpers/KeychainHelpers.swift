//
//  KeychainHelpers.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

//initialize this in your constants to avoid memory leaks and to make it available on your whole app

class KeychainHelpers{
    var customKeychainWrapperInstance:KeychainWrapper?;
    init(uniqueServiceName:String, accessGroup:String){
        self.customKeychainWrapperInstance = KeychainWrapper(serviceName: uniqueServiceName, accessGroup: accessGroup)
    }
    func removeObject(key:String)->Bool{
        return customKeychainWrapperInstance?.removeObject(forKey: key) ?? false;
    }
    func addObject(value:String, key:String)->Bool{
        return customKeychainWrapperInstance?.set(value, forKey: key) ?? false;
    }
    func retrieveData(key:String)->String{
        return customKeychainWrapperInstance?.string(forKey: key) ?? "";
    }
    func clear(){
        
    }
}
