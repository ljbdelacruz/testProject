//
//  YoutubeCollectionViewCell.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

public class YoutubeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumnail: UIImage!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subDescription: UILabel!
    @IBOutlet weak var timeLine: UILabel!
    static let identifier="youtubeCell";
    static let nibname="YoutubeCell";
    
    
    public func setTitle(title:String){
        self.title.text=title;
    }
    public func setupTime(hr:Int, min:Int, sec:Int){
        self.timeLine.text=(min<=9 ? "0"+String(min) : String(min))+":"+(sec<=9 ? "0"+String(sec) : String(sec));
    }
    public func setupSubDesc(views:Int, subdesc:String){
        self.subDescription.text = views>999 ?String(String(views).character(at: 0)!)+"K Views" : String(views)+" Views"
    }
}
