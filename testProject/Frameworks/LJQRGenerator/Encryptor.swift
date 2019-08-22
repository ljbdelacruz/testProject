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
    func encrypt(message: String) -> String {
        let testText = try! ClearMessage(string: message, using: .utf8)
        let encrytped = try! testText.encrypted(with: publicKey, padding: .PKCS1)
        let base64String = encrytped.base64String
        return base64String
    }
}

