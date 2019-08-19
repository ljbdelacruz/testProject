//
//  OverViewTransactionList.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit


//requires transactionCell1VM
public protocol IOverViewTransactionList{
    func didSelectRow(row:TransactionCell1VM)
    func bottomButtonPressed();
}

class OverViewTransactionList: UIView {
    public let xibname:String="OverViewTransactionList";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var tableViewContent: UITableView!
    @IBOutlet weak var bottomButton: UIButton!
    var vm:OverviewTransactionListVM?;
    var handler:IOverViewTransactionList?;
    
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
    }
    func initUI(vm:OverviewTransactionListVM, handler:IOverViewTransactionList){
        self.vm=vm;
        self.handler=handler;
        self.tableViewContent.delegate=self;
        self.tableViewContent.dataSource=self;
        self.tableViewContent.registerCustomCell(xib: TransactionCell1.xib, ridentifier: TransactionCell1.identifier);
    }

    func setContent(list:[TransactionCell1VM]){
        self.vm?.transactions=list;
        self.tableViewContent.reloadData()
    }
    @IBAction func bottomButtonOnClick(_ sender: Any) {
        handler?.bottomButtonPressed();
    }
}

extension OverViewTransactionList:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handler?.didSelectRow(row: self.vm!.transactions![indexPath.row]);
    }
}
extension OverViewTransactionList:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm!.transactions!.count;
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell1.identifier, for: indexPath) as! TransactionCell1;
        cell.setData(vm: vm!.transactions![indexPath.row]);
        return cell;
    }
}
