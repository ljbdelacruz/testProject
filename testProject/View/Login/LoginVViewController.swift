//
//  LoginVViewController.swift
//  
//
//  Created by devops on 31/07/2019.
//

import UIKit

class LoginVViewController: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    weak var user:UserModel?=UserModel();
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }    
    @IBAction func loginOnClick(_ sender: Any) {
//        performSegue(withIdentifier: "toDashboard", sender: nil);
        performSegue(withIdentifier: "qrScanningSegue", sender: nil)
//          performSegue(withIdentifier: "salesGraphSegue", sender: nil)
//        performSegue(withIdentifier: "transactionListSegue", sender: nil)
//        performSegue(withIdentifier: "SelectLanguageSegue", sender: nil)
//        performSegue(withIdentifier: "restLocalizationSegue", sender: nil)
//        performSegue(withIdentifier: "loginToScannerPassportSegue", sender: nil)
//        performSegue(withIdentifier: "qrGeneratorSegue", sender: nil)
    }
    @IBAction func forgotOnClick(_ sender: Any) {
        performSegue(withIdentifier: "forgotPasswordSegue", sender: nil);
    }

}


extension LoginVViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgotPasswordSegue"{
            let dest=segue.destination as! ForgotPasswordViewController
        }
    }
}
