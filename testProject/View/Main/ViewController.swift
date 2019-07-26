//
//  ViewController.swift
//  testProject
//
//  Created by devops on 25/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import BaseCodeAPI

class ViewController: UIViewController {
    var categoryRepo:CategoryRepository?;
    var presenter:MainPresenter!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        presenter.attachView(view: self);
//        presenter.loadCategory();
        var body=CategoryModel();
        body.name="Test";
        body.parent="0";
        presenter.insertCategory(body: body)
    }

}

extension ViewController:MainView{
    func getCategoryByIDSuccess(category: CategoryModel) {
        print(category.toJSON())
        print("Category")
    }
    
    func getretrieveCategoryByParentSuccess(categories: [CategoryModel]) {
        print(categories.toJSON())
        print("Category")
    }
    
    func insertCategorySuccess(category: CommonResponse) {
        print("Success");
        print(category.toJSON());
    }
    func error(err: Error) {
        print("Error");
        print(err.localizedDescription);
    }
    
    
}

