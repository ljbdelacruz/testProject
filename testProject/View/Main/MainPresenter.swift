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
    func getretrieveCategoryByParentSuccess(category:CategoryModel)
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
    
}
