//
//  YoutubeCell1.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

public class YoutubeCell1: UITableViewCell {
    public static let identifier="youtubeCell1";
    public static let xib="YoutubeCell1";
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var timeLine: UILabel!
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var subDesc: UILabel!
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func setTitle(title:String){
        self.mytitle.text=title;
    }
    public func setTimeLine(hr:Int, min:Int, sec:Int){
        self.timeLine.text=String.convertTime(hr: hr, min: min, sec: sec);
    }
    public func setViews(views:Int, subDesc:String){
        self.subDesc.text=String.convertViews(views: views)+subDesc;
    }

}
