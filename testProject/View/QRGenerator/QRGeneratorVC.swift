//
//  QRGeneratorVC.swift
//  testProject
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import MPQRCoreSDK
import QRSDKHelper

class QRGeneratorVC: UIViewController {
    var encryptor:LJCustomQRGeneratorEncryptor?;
    override func viewDidLoad() {
        super.viewDidLoad()
        encryptor=LJCustomQRGeneratorEncryptor();
        let value=encryptor!.encrypt(message: "Hello World");
        print(value)
        print(encryptor!.decrypt(message: value));
        print("DATA!!!");
        
        // Do any additional setup after loading the view.
    }
    
}
extension QRGeneratorVC{
    func setupPushPaymentTemp()->UIImage{
        let temp=PushPaymentData();
        temp.payloadFormatIndicator = "01"
        temp.pointOfInitiationMethod = "12"
        temp.setMerchantData(cCode: "170", name: "LJ Hardware Store", mCity: "Taguig", pCode: "8000", c: "465", merCatCode: "140", transCurrCode: "180", amt: "50")
        return temp.generateQRCode()!;
    }
    
}
