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
    var qrSetter:LJQRGenerator?;
    @IBOutlet weak var qrImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //encrypt message and return qrcode image with encrypted value when scanned
        self.qrSetter=LJQRGenerator(key: "public", handler: self);
        self.qrSetter!.setupQRString(data: "WIsh the world of storm through trials and error", width: 300, height: 300);
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
extension QRGeneratorVC:ILJQRGenerator{
    func getDecryptedMessage(data: LJQRDecryptionResponse) {
        print(data.data);
    }
    
    func getError(err: Error) {
        
    }
    func getEncryptedMessage(message: String) {
        print(message);
        
    }
    func getQRImage(image: UIImage) {
        self.qrImage.image=image;
    }
}

