//
//  Encryptor.swift
//  testProject
//
//  Created by devops on 22/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import SwiftyRSA

class LJCustomQRGeneratorEncryptor{
    
    let publicKey = try! PublicKey(pemNamed: "public")
    let pkey = try! PrivateKey(pemNamed: "private")
//    let privateKey = try! PrivateKey(pemNamed: "mykey")
    func encrypt(message: String) -> String {
        let testText = try! ClearMessage(string: message, using: .utf8)
        let encrytped = try! testText.encrypted(with: publicKey, padding: .PKCS1)
        let base64String = encrytped.base64String
        return base64String
    }
    func decrypt(message:String){
        
        let encrypted = try! EncryptedMessage(base64Encoded: message)
        let clear = try! encrypted.decrypted(with: pkey, padding: .PKCS1)
        let data = clear.data
        let base64String = clear.base64String
        let string = try! clear.string(encoding: .utf8)
        print(string);
    }
}

