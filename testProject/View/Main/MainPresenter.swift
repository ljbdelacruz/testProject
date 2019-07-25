//
//  MainPresenter.swift
//  testProject
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import BaseCodeAPI
import RxSwift

protocol MainView: BaseView {
    func getCategoryByIDSuccess(category:CategoryModel)
    func getretrieveCategoryByParentSuccess(categories:[CategoryModel])
    func insertCategorySuccess(category:CommonResponse)
    func error(err:Error)
}
class MainPresenter: BasePresenter {
    private let repository: CategoryRepository
    private let disposeBag: DisposeBag
    func getView() -> MainView? {
        return view as? MainView
    }
    init(repository: CategoryRepository) {
        self.repository = repository
        self.disposeBag = DisposeBag()
    }
    func loadCategory(){
        repository.getAll(parentID: "0").subscribe( { (event) in
            switch event {
            case .next(let response):
                self.getView()?.getretrieveCategoryByParentSuccess(categories: response)
                break;
            case .error(let error):
                print(error.localizedDescription)
                self.getView()?.error(err: error);
                break;
            case .completed:
                break
            }
        }).disposed(by: disposeBag)
    }
    
}
