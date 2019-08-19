//
//  SelectLanguage.swift
//  testProject
//
//  Created by devops on 19/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit


public protocol ISelectLanguage{
    func didSelect(item:SelectLanguageCell1VM)
}

public class SelectLanguage: UIView {
    public let xibname:String="SelectLanguage";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTitle: UILabel!
    var vm:SelectLanguageVM?;
    var handler:ISelectLanguage?;
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit() {
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        cView.fixInView(self)
        self.initTable()
    }
    func initTable(){
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.tableView.registerCustomCell(xib: SelectLanguageCell1.xib, ridentifier: SelectLanguageCell1.identifier)
    }
    //MARK: Step 1 setup data
    func setup(vm:SelectLanguageVM, handler:ISelectLanguage){
        self.handler=handler;
        self.vm=vm;
        self.tableView.reloadData();
        self.labelTitle.text=vm.label!;
    }
}

extension SelectLanguage:UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm!.items.count;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectLanguageCell1.identifier, for: indexPath) as! SelectLanguageCell1;
        cell.set(vm: vm!.items[indexPath.row]);
        return cell;
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handler?.didSelect(item: vm!.items[indexPath.row])
        for i in 0 ..< vm!.items.count {
            if i == indexPath.row{
                vm?.items[i].selected=true;
            }else{
                vm?.items[i].selected=false;
            }
        }
        tableView.reloadData();
    }
    
    
}
