//
//  SelectLanguageVM.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit


class SelectLanguageVM{
    public var label:String?
    public var items:[SelectLanguageCell1VM]=[];
    public static func initDummyData()->SelectLanguageVM{
        let temp=SelectLanguageVM();
        temp.label="Please Select Language"
        temp.items=SelectLanguageCell1VM.initDummyData(count: 3);
        return temp;
    }
    
}
