//
//  LoginVViewController.swift
//  
//
//  Created by devops on 31/07/2019.
//

import UIKit

class LoginVViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
}


extension LoginVViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgotPasswordSegue"{
            let dest=segue.destination as! ForgotPasswordViewController
            
        }
    }
}
