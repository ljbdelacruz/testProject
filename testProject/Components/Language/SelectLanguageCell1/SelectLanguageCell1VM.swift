//
//  SelectLanguageCell1VM.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import UIKit


public class SelectLanguageCell1VM{
    var id:String?;
    var label:String?;
    var source:String?
    var image:UIImage?
    var selected:Bool=false;
    
    
    static func initDummyData(count:Int)->[SelectLanguageCell1VM]{
        var list:[SelectLanguageCell1VM]=[];
        for i in 0 ..< count{
            list.append(SelectLanguageCell1VM.setDummy(id: "\(i)", label: "Language \(i)", source: "mvisa_blue"));
        }
        return list;
    }
    
    static func setDummy(id:String?, label:String?, source:String?)->SelectLanguageCell1VM{
        var temp=SelectLanguageCell1VM();
        temp.id=id;
        temp.label=label;
        temp.source=source;
        temp.image=UIImage(named: source!);
        return temp;
    }
}
