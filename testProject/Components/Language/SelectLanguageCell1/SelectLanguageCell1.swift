//
//  SelectLanguageCell1.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class SelectLanguageCell1: UITableViewCell {
    static var xib:String="SelectLanguageCell1"
    static var identifier="SelectLanguageCell1";
    @IBOutlet weak var checkMark: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myIcon: UIImageView!
    var vm:SelectLanguageCell1VM?;
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(vm!.selected, animated: true)
        // Configure the view for the selected state
    }
    func set(vm:SelectLanguageCell1VM){
        self.vm=vm;
        self.myLabel.text=vm.label;
        self.myIcon.image=vm.image;
        self.checkMark.isHidden = !vm.selected
    }
    
}
