//
//  ToWatchViewController.swift
//  testProject
//
//  Created by devops on 31/07/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class ToWatchViewController: UIViewController {

    var videos:[VideosModel]=[];
    var filteredVideos:[VideosModel]=[];
    
    @IBOutlet weak var sbVideo: UISearchBar!
    @IBOutlet weak var videoTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTV();
        self.setupValue()
        // Do any additional setup after loading the view.
        self.setupSB();
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
        filteredVideos=videos;
        videoTV.reloadData();
    }
}

extension ToWatchViewController:UITableViewDelegate{}
extension ToWatchViewController:UITableViewDataSource{
    func setupTV(){
        self.videoTV.delegate=self;
        self.videoTV.dataSource=self;
        self.videoTV.registerCustomCell(xib: YoutubeCell1.xib, ridentifier: YoutubeCell1.identifier);
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredVideos.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTV.dequeueReusableCell(withIdentifier: YoutubeCell1.identifier, for: indexPath) as! YoutubeCell1
        let video=filteredVideos[indexPath.row];
        cell.setTitle(title: video.title);
        cell.setTimeLine(hr: video.hour, min: video.minute, sec: video.seconds);
        cell.setViews(views: video.views, subDesc: "");
        return cell;
    }
    
    
}
extension ToWatchViewController:UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText);
        if searchText == "" {
            self.filteredVideos=videos;
            self.videoTV.reloadData();
            self.view.endEditing(true);
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!);
        self.filteredVideos=videos.filter({$0.title.lowercased().contains(searchBar.text!.lowercased())});
        self.videoTV.reloadData();
        self.view.endEditing(true);
    }
    func setupSB(){
        self.sbVideo.delegate=self;
    }
}
