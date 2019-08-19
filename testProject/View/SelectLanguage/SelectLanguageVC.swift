//
//  SelectLanguageVC.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class SelectLanguageVC: UIViewController {

    @IBOutlet weak var selectLanguage: SelectLanguage!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectLanguage.setup(vm: SelectLanguageVM.initDummyData(), handler: self);
    }

}


extension SelectLanguageVC:ISelectLanguage{
    func didSelect(item: SelectLanguageCell1VM) {
        print(item.label);
    }
    
    
}
