//
//  OverviewTransactionListVM.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import UIKit


class OverviewTransactionListVM{
    var header:String?;
    var bottomButtonLabel:String?;
    var transactions:[TransactionCell1VM]?;
    
    
    //MARK: Dummy data
    static func initDummyData()->OverviewTransactionListVM{
        let overViewVM=OverviewTransactionListVM();
        overViewVM.header="Latest"
        overViewVM.bottomButtonLabel="View All Transactions";
        overViewVM.transactions=[];
        
        let temp=TransactionCell1VM();
        temp.label="Hush Puppies"
        temp.price=20.00;
        temp.image=UIImage(named: "mvisa_blue");
        temp.currencyCode=240;
        temp.subDesc="Aug 16, 2019 12:03 PM"
        
        let temp1=TransactionCell1VM();
        temp1.label="Hush Puppies"
        temp1.price=30.00;
        temp1.image=UIImage(named: "mvisa_blue");
        temp1.currencyCode=240;
        temp1.subDesc="Aug 16, 2019 01:03 PM"
        
        let temp2=TransactionCell1VM();
        temp2.label="Mr Donut"
        temp2.price=40.00;
        temp2.image=UIImage(named: "mvisa_blue");
        temp2.currencyCode=240;
        temp2.subDesc="Aug 16, 2019 01:03 PM"
        
        overViewVM.transactions?.append(temp);
        overViewVM.transactions?.append(temp1);
        overViewVM.transactions?.append(temp2);
        overViewVM.transactions?.append(temp2);
        overViewVM.transactions?.append(temp2);
        
        return overViewVM;
    }

    
}


