//
//  ForgotPasswordViewController.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

public class ForgotPasswordViewController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func backOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
}




extension ForgotPasswordViewController{
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backSegue"{
            let dest=segue.destination as! LoginVViewController
            
        }
    }
}
