//
//  DashboardViewPresenter.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 01/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import CoreData
import BaseCodeAPI
import RxSwift

protocol DashboardView: BaseView {
    func successCoreData()
    func successFetch(categories:[Category])
    func error();
}
class DashboardPresenter: BasePresenter {
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer;
    private let repository: CategoryRepository
    var cdHelper:CoreDataHelpers?;
    private let disposeBag: DisposeBag
    func getView() -> DashboardView? {
        return view as? DashboardView
    }
    init(repository: CategoryRepository) {
        self.repository = repository
        self.disposeBag = DisposeBag()
        cdHelper=CoreDataHelpers(context: context);
        super.init();
        cdHelper?.myprotocol=self;
    }
    
    func saveData(){
        let category=self.cdHelper?.setTableEntity(table: "Category")
        category!.setValue(10, forKey: "parent")
        category!.setValue(0, forKey: "id")
        category!.setValue("test10", forKey: "name");
        cdHelper?.saveContext();
    }
    func fetchData(){
        var data=cdHelper?.fetchRequestTable(table: "Category") as! [Category];
        self.getView()?.successFetch(categories: data)
    }
}

//handler for saving 
extension DashboardPresenter:CoreDataHelpersProtocol{
    func successSave() {
        self.getView()?.successCoreData();
    }
    
    func errorSave() {
        self.getView()?.error();
    }
    
    
}
