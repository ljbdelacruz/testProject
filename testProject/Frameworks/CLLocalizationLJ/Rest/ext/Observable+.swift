//
//  Observable+.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Moya
import RxSwift
import BaseCodeAPI


public extension ObservableType where E == Response {
    public func mapErrors(provider: CLLJProvider) -> Observable<E> {
        return self.filterSuccessfulStatusCodes()
            .catchError { e in
                guard let error = e as? MoyaError else {
                    throw e
                }
                guard case .statusCode(let response) = error else {
                    throw e
                }
                if let apiError = try? response.mapObject(CustomAPIError.self) {
                    print(response.statusCode);
                }
                throw e;
        }
        
    }
    public func mapErrors(provider: LJQRProvider) -> Observable<E> {
        return self.filterSuccessfulStatusCodes()
            .catchError { e in
                guard let error = e as? MoyaError else {
                    throw e
                }
                guard case .statusCode(let response) = error else {
                    throw e
                }
                if let apiError = try? response.mapObject(CustomAPIError.self) {
                    print(response.statusCode);
                }
                throw e;
        }
        
    }
}
