//
//  String+.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation

extension String{
    
    public static func convertViews(views:Int)->String{
        if(views > 999){
            return String(String(views).prefix(1))+"K Views";
        }else if(views > 9999){
            return String(String(views).prefix(2))+"K Views"
        }
        return String(views)+" Views";
    }
    public static func convertTime(hr:Int, min:Int, sec:Int)->String{
        if(hr==0){
            return (min <= 9 ? "0" + String(min) : String(min))+":"+(sec <= 9 ? "0"+String(sec) : String(sec));
        }
        return (hr <= 9 ? "0" + String(hr) : String(hr))+":"+(min <= 9 ? "0"+String(min) : String(min))+":"+(sec <= 9 ? "0"+String(sec) : String(sec));
    }
}
