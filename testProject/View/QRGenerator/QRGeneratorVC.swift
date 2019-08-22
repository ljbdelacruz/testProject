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
        let data=try! setupPushPaymentTemp().generatePushPaymentString()
        let value=encryptor!.encrypt(message: data);
        print(value)
        // Do any additional setup after loading the view.
    }
    
}
extension QRGeneratorVC{
    func setupPushPaymentTemp()->PushPaymentData{
        let temp=PushPaymentData();
        temp.payloadFormatIndicator = "01"
        temp.pointOfInitiationMethod = "12"
        temp.setMerchantIdetifier(mi: .merchantIdentifierVisa02, data: "4600678934521435")
        temp.setMerchantData(cCode: "CN", name: "LJ Hardware Store", mCity: "Taguig", pCode: "8000", c: "6403", merCatCode: "0742", transCurrCode: "156", amt: "50")
        return temp;
    }
    
}
