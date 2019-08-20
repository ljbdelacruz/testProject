//
//  CLUserDefaults.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation

//requires the UserDefaultHelpers

enum CLUserDefaultsKey{
    case version
    static func getKey(data:CLUserDefaultsKey)->String{
        switch data{
        case .version:
            return "clversion"
        }
    }
}

class CLUserDefaults{
    var ushelper=UserDefaultsHelpers()
    var version:String?="";
    init(){
        self.version = ushelper.readData(key: CLUserDefaultsKey.getKey(data: .version));
    }
    func setVersion(version:String){
        UserDefaults.standard.set(version, forKey: CLUserDefaultsKey.getKey(data: .version));
        
        
//        ushelper.setData(value: version, key: CLUserDefaultsKey.getKey(data: .version))
        self.version=version;
    }
    
    
}
