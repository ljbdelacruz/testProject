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
    var qrSetter:LJQRGenerator?=LJQRGenerator(key: "public");
    @IBOutlet weak var qrImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //encrypt message and return qrcode image with encrypted value when scanned
        self.qrImage.image = self.qrSetter!.setupQRString(data: "Hello World I Am Dragon", width: 300, height: 300);
        
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
