//
//  HomeViewController.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var Videos: UICollectionView!
    @IBOutlet weak var lasbel: UILabel!
    var videos:[VideosModel]=[];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVideosCV();
        self.setupValue();
    }
    func setupValue(){
        let temp=VideosModel();
        temp.title="Jessica Soho Report";
        temp.views=899;
        temp.views=899;
        temp.hour=0;
        temp.minute=9;
        temp.seconds=4;
        videos.append(temp);
        let temp2=VideosModel();
        temp2.title="Jojos Crib #2 Party at jojos swimming pool";
        temp2.views=899;
        temp2.hour=0;
        temp2.minute=11;
        temp2.seconds=40;
        videos.append(temp2);
        
        Videos.reloadData();
    }
    
}

extension HomeViewController:UICollectionViewDelegate{
    
}


extension HomeViewController:UICollectionViewDataSource{
    func initVideosCV(){
        Videos.delegate=self;
        Videos.dataSource=self;
        Videos.registerCustomCell(nib: YoutubeCollectionViewCell.nibname, reuseIdentifier: YoutubeCollectionViewCell.identifier);
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Videos.dequeueReusableCell(withReuseIdentifier: YoutubeCollectionViewCell.identifier, for: indexPath) as! YoutubeCollectionViewCell
        let row = indexPath.row
        let video = videos[row]
        cell.setupTime(hr: video.hour, min: video.minute, sec: video.seconds);
        cell.setupSubDesc(views: video.views, subdesc: "");
        cell.setTitle(title: video.title);
        
        return cell
    }
    
    
}
