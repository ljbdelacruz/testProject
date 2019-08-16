//
//  TransactionListVC.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit

class TransactionListVC: UIViewController {
    @IBOutlet weak var overViewLayout: UIView!
    
    //MARK: Toggle Options
    @IBOutlet weak var toggleOptions: TogglabbleOptions!
    var options:[TogglabbleOptionsVM]=[];

    //MARK: CalendarPicker variables
    @IBOutlet weak var calendarUI: CalendarPicker!
    var fromDate:CalendarPickerVM?;
    var toDate:CalendarPickerVM?;
    var calenderPickercount:Int=1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDummyDataToggleOptions();
        initDummyDataDatePicker();
        
        self.initToggleOptions();
        self.initCalendar();
    }
    
    func initToggleOptions(){
        toggleOptions.setupResponseHandler(handler: self)
        toggleOptions.setupRecognizer(view: self.overViewLayout, parentView: toggleOptions);
        toggleOptions.initializeButtons(options: self.options);
    }
    func initCalendar(){
        calendarUI.setup(handler: self)
        calendarUI.setupOverview(view: overViewLayout, parentView: calendarUI)
        calendarUI.setupVM(vm: self.fromDate!);
    }
    
    @IBAction func toggleOnClick(_ sender: Any) {
        toggleOptions.myShow();
    }
}

//MARK: Toggle Option Delegate
extension TransactionListVC:ITogglabbleOption{
    func buttonOnClick(value: Int) {
        print(value);
        switch value {
        case 1:
            break;
        case 2:
            toggleOptions.myHide();
            self.calendarUI.myShow();
            break;
        default:
            break;
        }
    }
    
    
}

//MARK: ICalendar Delegate
extension TransactionListVC:ICalendarPicker{
    func hideOverlay() {
        self.calenderPickercount=1;
        self.calendarUI.setupVM(vm: fromDate!);
    }
    
    func okOnClick(vm: CalendarPickerVM) {
        calenderPickercount+=1;
        print(vm.dateSelected!.description)
        if calenderPickercount == 2 {
            self.fromDate=vm;
            self.calendarUI.myHide();
            self.calendarUI.setupVM(vm: self.toDate!);
            self.calendarUI.myShow();
        }else{
            self.toDate=vm;
            self.calenderPickercount=1;
            self.calendarUI.myHide();
            self.calendarUI.setupVM(vm: fromDate!);
            //completes the process
        }
    }
    func cancelOnClick() {
        self.calenderPickercount=1;
        self.calendarUI.myHide();
        self.calendarUI.setupVM(vm: fromDate!);
    }
}


extension TransactionListVC{
    func initDummyDataToggleOptions(){
        let option1=TogglabbleOptionsVM();
        option1.label="All";
        option1.value=1;

        let option2=TogglabbleOptionsVM();
        option2.label="Filter By Date";
        option2.value=2;
        options.append(option1)
        options.append(option2)
    }
    func initDummyDataDatePicker(){
        self.fromDate=CalendarPickerVM();
        self.fromDate?.title="FROM"
        self.fromDate?.dateSelected=Date();
        self.toDate=CalendarPickerVM();
        self.toDate!.title="TO";
        self.toDate?.dateSelected=Date();
        
    }
}


