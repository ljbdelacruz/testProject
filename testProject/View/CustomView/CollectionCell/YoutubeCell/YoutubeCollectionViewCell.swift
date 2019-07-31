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
        self.timeLine.text=String.convertTime(hr: hr, min: min, sec: sec)
    }
    public func setupSubDesc(views:Int, subdesc:String){
        self.subDescription.text=String.convertViews(views: views)+subdesc;
    }
}
