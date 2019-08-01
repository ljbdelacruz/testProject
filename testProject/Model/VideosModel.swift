//
//  VideosModel.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import ObjectMapper

class VideosModel: Mappable {
    
    var id: String!
    var title: String!
    var views: Int!
    var hour: Int!;
    var minute: Int!;
    var seconds:Int!;
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        views <- map["views"]
        hour <- map["hour"]
        minute <- map["minute"]
        seconds <- map["seconds"]
    }
    
}
