//
//  UITableView+.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func registerCustomCell(xib: String, ridentifier:String) {
        let nib = UINib(nibName: xib, bundle: nil)
        self.register(nib, forCellReuseIdentifier: ridentifier);
    }
}
