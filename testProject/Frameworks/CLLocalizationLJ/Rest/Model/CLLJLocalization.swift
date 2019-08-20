//
//  CLLJLocalization.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation


import ObjectMapper

public class CLLJLocalization: Mappable {
    public var id: Int?
    public var key: String?
    public var value: String?
    public var langID: Int?
    public var appID: String?
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        id <- map["id"]
        key <- map["key"]
        value <- map["value"]
        langID <- map["langID"]
        appID <- map["appID"]
    }
}
