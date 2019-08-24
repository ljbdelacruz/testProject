//
//  LJQRGenerator.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 24/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import UIKit
import QRCode


class LJQRGenerator{
    let encryptor:LJCustomQRGeneratorEncryptor?;
    init(key:String){
        encryptor=LJCustomQRGeneratorEncryptor(key: key)
    }
    func setupQRString(data:String, width:Int, height:Int)->UIImage{
        let encMessage=encryptor!.encrypt(message:data);
        var qr=QRCode(encMessage);
        qr!.size = CGSize(width: width, height: height)
        return qr!.image!
    }
    
}
