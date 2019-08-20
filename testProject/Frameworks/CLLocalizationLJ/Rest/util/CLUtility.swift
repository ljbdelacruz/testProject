//
//  CLUtility.swift
//  testProject
//
//  Created by devops on 20/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import RxSwift


protocol ICLUtility{
    func getResultCheckVersion(data:CLAppVersion)
    func getResultLocalization(datas:[CLLJLocalization])
    func getError(err:Error?)
}

class CLUtility{
    var localRepo:CLLJLocalizationRepo=CLLJLocalizationRepo();
    var clAppVersionRepo:CLAppVersionRepo=CLAppVersionRepo();
    var handler:ICLUtility?;
    private let disposeBag: DisposeBag = DisposeBag();
    init(handler:ICLUtility){
        self.handler=handler;
    }
    //MARK: Checking Version
    func checkVersion(id:String){
        clAppVersionRepo.checkVersion(id: id).subscribe( { (event) in
            switch event {
            case .next(let response):
                self.handler!.getResultCheckVersion(data: response)
                break;
            case .error(let error):
                self.handler!.getError(err: error);
                break;
            case .completed:
                break;
            }
        }).disposed(by: disposeBag)
    }

    //MARK: Localization repo
    func getLocalization(id:String){
        localRepo.getLocalizationByID(id: id).subscribe({ (event) in
            switch event {
            case .next(let response):
                self.handler!.getResultLocalization(datas: response)
                break;
            case .error(let error):
                self.handler!.getError(err: error);
                break;
            case .completed:
                break
            }
        }).disposed(by: disposeBag)
        
    }
    
}
