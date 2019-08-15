//
//  SalesGraphVCView.swift
//  testProject
//
//  Created by devops on 15/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import Charts

class SalesGraphVCView: UIViewController {

    @IBOutlet weak var myBGraphView: MyBarGraph!
    override func viewDidLoad() {
        super.viewDidLoad()
        myBGraphView.setData(vm: MyBarGraph.initDummyData());
    }
}
