//
//  TransactionList.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

protocol ITransactionList{
    func didSelect(item:TransactionCell1VM)
}

class TransactionList: UIView {
    public let xibname:String="TransactionList";
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var cView: UIView!
    public var vm:TransactionListVM?;
    public var handler:ITransactionList?;
    
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
        self.initTable();
    }
    func initTable(){
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.tableView.registerCustomCell(xib: TransactionCell1.xib, ridentifier: TransactionCell1.identifier)
    }
    func set(handler:ITransactionList, vm:TransactionListVM){
        self.handler=handler;
        self.vm=vm;
    }
}

extension TransactionList:UITableViewDelegate, UITableViewDataSource{
    //MARK: Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm!.sections[section].list.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell1.identifier, for: indexPath) as! TransactionCell1;
        cell.setData(vm: vm!.sections[indexPath.section].list[indexPath.row]);
        return cell;
    }
    //MARK: cell event Handler
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.handler?.didSelect(item: self.vm!.sections[indexPath.section].list[indexPath.row]);
    }
    
    
    //MARK: Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm!.sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return vm!.sections[section].header!
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(origin: .zero, size: .zero))
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 180/255, green: 30/255, blue: 140/255, alpha: 1.0)
        label.text = vm!.sections[section].header!
        label.sizeToFit()
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        sectionView.backgroundColor = .white
        sectionView.addSubview(label)
        return sectionView
    }
}


