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
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: set properties
    public func setImage(image:UIImage){
        self.cellImage.image=image;
    }
    public func setCellName(name:String){
        self.cellName.text=name;
    }
    public func setDate(date:String){
        self.cellDate.text=date;
    }
    public func setCellPrice(price:String){
        self.cellPrice.text=price;
    }
}
