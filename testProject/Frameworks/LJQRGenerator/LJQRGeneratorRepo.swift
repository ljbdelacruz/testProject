//
//  LJQRGeneratorRepo.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 24/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_ObjectMapper
import ObjectMapper

class LJQRGeneratorRepo{
    let provider = LJQRProvider()
    init(){
    }
    func decrypt(data:String)->Observable<LJQRDecryptionResponse>{
        return provider.rx.request(.decryptData(data: data))
            .asObservable()
            .mapErrors(provider: provider)
            .mapObject(LJQRDecryptionResponse.self)
        
    }
}
public class LJQRDecryptionResponse: Mappable {
    public var data: String?
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        data <- map["data"]
    }
}



