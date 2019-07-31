//
//  UserModel.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import ObjectMapper

class UserModel: Mappable {
    
    var id: String!
    var token:String!
    var username:String!;
    var password:String!;
    
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        token <- map["token"]
        username <- map["username"]
        password <- map["password"]
    }
    
}
