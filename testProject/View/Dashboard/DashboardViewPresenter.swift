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

protocol DashboardView: BaseView {
    func successCoreData()
    func failedCoreData()
}
class MainPresenter: BasePresenter {
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    private let repository: CategoryRepository
    private let disposeBag: DisposeBag
    func getView() -> DashboardView? {
        return view as? DashboardView
    }
    init(repository: CategoryRepository) {
        self.repository = repository
        self.disposeBag = DisposeBag()
    }    
    func SaveData(name:String){
        let newTask=Category(context: self.context);
        newTask.set(name: name);
        self.taskCategories.append(newTask);
        self.UpdateData();
    }
    func UpdateData(){
        do{
            try context.save();
            self.getView()?.successCoreData();
        }catch{
            self.getView()?.failedCoreData();
        }
    }
    
    
    
    
}
