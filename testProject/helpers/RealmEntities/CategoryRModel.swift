//
//  CategoryRModel.swift
//  testProject
//
//  Created by devops on 09/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//
import RealmSwift

// Dog model
class CategoryRModel: Object {
    @objc dynamic var id:Int=0
    @objc dynamic var name:String="";
    @objc dynamic var parent:String="";
}

