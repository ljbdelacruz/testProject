//
//  UICollectionView+.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCustomCell(nib:String, reuseIdentifier:String) {
        let nib = UINib(nibName: nib, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}
