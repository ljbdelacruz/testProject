//
//  CLAppVersion.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//
import ObjectMapper

public class CLAppVersion: Mappable {
    public var id: Int?
    public var version: String?
    public var appid: String?
    
    public init(){}
    public required init?(map: Map) {}
    public func mapping(map: Map) {
        id <- map["id"]
        version <- map["version"]
        appid <- map["appid"]
    }
}
