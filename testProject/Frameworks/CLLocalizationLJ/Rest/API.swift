//
//  API.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//
import Alamofire
import Moya
import ObjectMapper


public class CLLJProvider: MoyaProvider<CLLJService> {
    init(plugins: [PluginType] = []) {
    }
}
enum CLLJService  {
    //category
    case checkAppLocalVersion(id:String)
    case getLocalization(id:String)
}
extension CLLJService: TargetType {
    var baseURL: URL {
        let urlString = Constants.baseURL;
        return URL(string: urlString)!
    }
    var path: String {
        switch self {
        case .checkAppLocalVersion(let id):
            return "/applocalversion/checkVersion/"+id;
        case .getLocalization(let id):
            return "/localization/getByAppID/"+id
        }
    }
    var method: Moya.Method {
        switch self {
        case .checkAppLocalVersion, .getLocalization:
            return .get;
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .checkAppLocalVersion, .getLocalization:
            return .requestPlain;
        }
    }
    // MARK - Header
    var headerBasicAuthClient: String{
//        return Constants.jwot;
        return ""
    }
    var headers: [String: String]? {
        switch self {
        case .checkAppLocalVersion, .getLocalization:
            return getHeader(headerUsageType: .basic1)
        }
    }
}

extension CLLJService{
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

enum HeaderUsageType {
    case basic1, basic2, clientGrant, passwordGrant
}
