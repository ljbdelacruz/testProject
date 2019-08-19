//
//  TransactionListVM.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import UIKit

public class TransactionListVM{
    var sections:[TransactionListVMSection]=[];
    
    
    //MARK: Dummy Data
    public static func initDummyData()->TransactionListVM{
        let data=TransactionListVM();
        let temp=TransactionListVMSection.setDummyData(header: "Jan", count: 3)
        data.sections.append(temp);
        let temp1=TransactionListVMSection.setDummyData(header: "Feb", count: 10)
        data.sections.append(temp1);
        return data;
    }
    
}
public class TransactionListVMSection{
    public var header:String?
    public var list:[TransactionCell1VM]=[]
    
    //MARK: Dummy Data
    static func setDummyData(header:String, count:Int)->TransactionListVMSection{
        var temp=TransactionListVMSection();
        temp.header=header;
        for i in 0 ..< count {
            let temp2=TransactionCell1VM();
            temp2.label="Hush Puppies 1"
            temp2.price=30.00;
            temp2.image=UIImage(named: "mvisa_blue");
            temp2.currencyCode=240;
            temp2.subDesc="Aug 16, 2019 01:03 PM"
            temp.list.append(temp2);
        }
        return temp;
    }
    
    
}
