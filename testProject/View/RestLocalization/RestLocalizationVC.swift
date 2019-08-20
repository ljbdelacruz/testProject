//
//  RestLocalizationVC.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class RestLocalizationVC: UIViewController {
    var clfunc:MainCLLLocalizationLJ?;
    
    @IBOutlet weak var myLocalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set("0", forKey: "clversion");
        clfunc=MainCLLLocalizationLJ(handler: self);
        clfunc?.checkVersion(id: "1ee");
        print("PATH");
    }

}

extension RestLocalizationVC:IMainCLLLocalizationLJ{
    func finishSettingUp() {
        print("FINISH SETUP")
        print(self.clfunc?.getLocalization(local: "Please Stay With Me", langID: 2))
        print("DISPLAY!!!");
    }
    func error(err: Error) {
    }
    
    
    
}
