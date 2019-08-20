//
//  MainCLLLocalizationLJ.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

/*
 Note: How to use MainCLL class
 
 Required Class: UserDefaultsHelper, RealmHelpers
 
 
*/


import Foundation

public protocol IMainCLLLocalizationLJ{
    func finishSettingUp();
    func error(err:Error)
}

class MainCLLLocalizationLJ{
    var userDef:CLUserDefaults=CLUserDefaults();
    var util:CLUtility?
    var realm:CLLRealmLJ?;
    var appVersion:CLAppVersion?;
    var handler:IMainCLLLocalizationLJ?;
    init(handler:IMainCLLLocalizationLJ) {
        self.handler=handler;
        self.util=CLUtility(handler:self);
        self.realm=CLLRealmLJ();
    }
    func checkVersion(id:String){
        self.util?.checkVersion(id: "1ee")
    }
    func getLocalization(local:String, langID:Int)->String{
        return self.realm!.getValueByKey(key: local, langID: langID)
    }
    
}


extension MainCLLLocalizationLJ:ICLUtility{
    func getResultCheckVersion(data: CLAppVersion) {
        if (userDef.version == nil ? "" : userDef.version) != data.version{
            //update
            self.appVersion=data;
            self.util?.getLocalization(id: data.appid!)
        }else{
            self.handler?.finishSettingUp();
        }
    }
    func getResultLocalization(datas: [CLLJLocalization]) {
        self.realm?.removeAll();
        self.realm?.addByList(datas: datas);
        userDef.setVersion(version: appVersion!.version!);
        self.handler?.finishSettingUp();
    }
    func getError(err: Error?) {
        handler?.error(err: err!);
    }
    
    
}
