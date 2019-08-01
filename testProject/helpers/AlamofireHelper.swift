//
//  AlamofireHelper.swift
//  testProject
//
//  Created by devops on 01/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import Alamofire


class AlamoFireHelper{
    public var baseURL:String="";
    init(){
        
    }
    convenience init(url:String){
        self.init();
        self.baseURL=url;
    }
    
    public func getRequest(suburl:String, completion: @escaping ([[String:Any]]?) -> Void){
        let url=URL(string: baseURL+suburl)!
        Alamofire.request(url,
                          method: .get,
                          parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                        completion(nil)
                    return
                }
                guard let value = response.result.value as? [String: Any],
                    let rows = value["rows"] as? [[String: Any]] else {
                        completion(nil)
                        return
                }
                completion(rows);
            }
    }
    
}
