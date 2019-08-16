//
//  CalendarPicker.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

public protocol ICalendarPicker{
    func cancelOnClick();
    func okOnClick(vm:CalendarPickerVM);
    func hideOverlay();
}

class CalendarPicker: UIView {
    public let xibname:String="CalendarPicker";
    
    @IBOutlet var cView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var overViewLayout:UIView?
    var parentView:UIView?
    var handler:ICalendarPicker?
    var vm:CalendarPickerVM?;
    
    
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
    //MARK: Step 1 set handler
    func setup(handler:ICalendarPicker){
        self.handler=handler;
    }
    //MARK: Step 2 set the overviewLayout
    public func setupOverview(view:UIView, parentView:UIView){
        let hideOverlayView = UITapGestureRecognizer(target: self, action: #selector(self.didHideOverlayView))
        view.addGestureRecognizer(hideOverlayView)
        self.overViewLayout=view;
        self.parentView=parentView;
        self.myHide();
    }
    @objc func didHideOverlayView() {
        self.myHide();
        handler?.hideOverlay();
    }
    public func myHide(){
        self.parentView?.isHidden=true;
        self.overViewLayout?.isHidden=true;
    }
    public func myShow(){
        self.parentView?.isHidden=false;
        self.overViewLayout?.isHidden=false;
    }
    //MARK: Step 3 set vm to set data
    func setupVM(vm:CalendarPickerVM){
        self.titleLabel.text=vm.title;
        self.datePicker.setDate(vm.dateSelected!, animated: true);
        self.vm=vm;
    }

    
    
    @IBAction func cancelOnClick(_ sender: Any) {
        handler?.cancelOnClick();
    }
    @IBAction func okOnClick(_ sender: Any) {
        vm?.dateSelected=datePicker.date;
        handler?.okOnClick(vm:vm!);
    }
}
