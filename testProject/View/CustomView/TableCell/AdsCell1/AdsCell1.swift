//
//  AdsCell1.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 11/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class AdsCell1: UITableViewCell {
    public static let identifier="AdsCell1";
    public static let xibName="AdsCell1";
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var mySubDesc: UILabel!
    @IBOutlet weak var myPrice: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
