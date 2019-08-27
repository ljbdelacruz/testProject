//
//  TouchIDVC.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 27/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class TouchIDVC: UIViewController {

    var helper:LJTouchID?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.helper=LJTouchID(handler: self, message:"Please authenticate to process payment within the app");
        // Do any additional setup after loading the view.
    }
    @IBAction func touchIDOnCLick(_ sender: Any) {
        helper?.authenticateUserTouchID();
    }
}

extension TouchIDVC:ILJTouchID{
    func successTouchID() {
        print("Success TouchID")
    }
    
    func getError(err: Error?) {
        print(err?.localizedDescription);
    }
    
    
}
