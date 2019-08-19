//
//  AllTransactionListVC.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class AllTransactionListVC: UIViewController {
    
    @IBOutlet weak var tlTableView: TransactionList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tlTableView.set(handler: self, vm: TransactionListVM.initDummyData())
        // Do any additional setup after loading the view.
    }
}

extension AllTransactionListVC:ITransactionList{
    func didSelect(item: TransactionCell1VM) {
        print(item.label!);
    }
    
    
}
