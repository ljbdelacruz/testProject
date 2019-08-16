//
//  TransactionCell1.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 07/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

public class TransactionCell1: UITableViewCell {
    public static var identifier:String="transactionTVCell1";
    public static var xib:String="TransactionCell1";
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    var vm:TransactionCell1VM?;
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setData(vm:TransactionCell1VM){
        self.cellImage.image=vm.image;
        self.cellName.text=vm.label;
        self.cellDate.text=vm.subDesc
        self.cellPrice.text="\(vm.price!)"
    }

}
