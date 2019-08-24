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
import RxSwift

public protocol ILJQRGenerator {
    func getEncryptedMessage(message:String)
    func getQRImage(image:UIImage)
    func getDecryptedMessage(data:LJQRDecryptionResponse)
    func getError(err:Error)
    
}

class LJQRGenerator{
    let encryptor:LJCustomQRGeneratorEncryptor?;
    var handler:ILJQRGenerator?;
    var repo:LJQRGeneratorRepo=LJQRGeneratorRepo();
    private let disposeBag: DisposeBag = DisposeBag();
    
    init(key:String, handler:ILJQRGenerator){
        encryptor=LJCustomQRGeneratorEncryptor(key: key)
        self.handler=handler;
    }
    func setupQRString(data:String, width:Int, height:Int){
        let encMessage=encryptor!.encrypt(message:data);
        self.handler?.getEncryptedMessage(message: encMessage);
        var qr=QRCode(encMessage);
        qr!.size = CGSize(width: width, height: height)
        self.handler?.getQRImage(image: qr!.image!);
    }
    func decryptQR(data:String){
        repo.decrypt(data: data).subscribe( { (event) in
            switch event {
            case .next(let response):
                self.handler?.getDecryptedMessage(data:response)
                break;
            case .error(let error):
                self.handler!.getError(err: error);
                break;
            case .completed:
                break;
            }
        }).disposed(by: disposeBag)    }
    
}
