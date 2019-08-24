//
//  LJQRGeneratorAPI.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 24/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Alamofire
import Moya
import ObjectMapper

public class LJQRProvider: MoyaProvider<LJQRGeneratorService> {
    init(plugins: [PluginType] = []) {
    }
}
enum LJQRGeneratorService  {
    //category
    case decryptData(data:String)
}
extension LJQRGeneratorService: TargetType {
    var baseURL: URL {
        let urlString = Constants.baseURL;
        return URL(string: urlString)!
    }
    var path: String {
        switch self {
        case .decryptData:
            return "/applocalversion/decrypt";
        }
    }
    var method: Moya.Method {
        switch self {
        case .decryptData:
            return .post;
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .decryptData(let data):
            let temp:[String:Any]=["data":data];
            return .requestParameters(parameters: temp, encoding: JSONEncoding.default);
        }
    }
    // MARK - Header
    var headerBasicAuthClient: String{
        //        return Constants.jwot;
        return ""
    }
    var headers: [String: String]? {
        switch self {
        case .decryptData:
            return getHeader(headerUsageType: .basic2)
        }
    }
}

extension LJQRGeneratorService{
    //implement header modification here this will get executed before sending the request to server
    func getHeader(headerUsageType:HeaderUsageType)->[String: String]{
        switch headerUsageType {
        case .basic1:
            return ["Accept": "application/json",
                    "Content-Type": "application/json"]
        default:
            return ["Accept": "application/json",
                    "Content-Type": "application/json"]
        }
    }
}
