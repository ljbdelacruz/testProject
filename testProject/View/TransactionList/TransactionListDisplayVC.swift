//
//  TransactionListDisplayVC.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class TransactionListDisplayVC: UIViewController {

    @IBOutlet weak var overViewTransaction: OverViewTransactionList!
    var overViewVM:OverviewTransactionListVM?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overViewTransaction.initUI(vm: OverviewTransactionListVM.initDummyData(), handler: self);
        // Do any additional setup after loading the view.
    }
}

extension TransactionListDisplayVC:IOverViewTransactionList{
    func didSelectRow(row: TransactionCell1VM) {
        print(row.label!);
    }
    func bottomButtonPressed() {
        print("Bottom Button pressed")
    }
}
