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
    func successFetch(videos:[VideosModel])
    func error();
}
class DashboardPresenter: BasePresenter {
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
//    func LoadData(request:NSFetchRequest<VideosModel> = Category.fetchRequest(), addOnPredicate:NSPredicate? = nil){
//        request.predicate=addOnPredicate != nil ? addOnPredicate : nil;
//        do{
//            var videos=context.fetch(request)
//            self.getView()?.successFetch(videos: videos);
//
//        }catch{
//            print("\(error.localizedDescription)");
//        }
//    }
//
//    func SaveData(name:String){
//        let newTask=Category(context: self.context);
//        newTask.set(name: name);
//        self.taskCategories.append(newTask);
//        self.UpdateData();
//    }
//    func UpdateData(){
//        do{
//            try context.save();
//            self.getView()?.successCoreData();
//        }catch{
//            self.getView()?.error();
//        }
//    }
    
    
    
    
}
