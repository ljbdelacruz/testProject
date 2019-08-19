//
//  TogglabbleOptions.swift
//  testProject
//
//  Created by devops on 16/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
//Requires the overlaylayout to work since this will be tied to the
//event listener to close the popup


public protocol ITogglabbleOption{
    func buttonOnClick(value:Int)
}

class TogglabbleOptions: UIView {
    public let xibname:String="TogglabbleOptions";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    var overViewLayout:UIView?;
    var parentView:UIView?;
    var responseHandler:ITogglabbleOption?;
    var items:[TogglabbleOptionsVM]?=[];
    
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
    public func myHide(){
        self.parentView!.isHidden=true;
        self.overViewLayout!.isHidden=true;
    }
    public func myShow(){
        self.parentView?.isHidden=false;
        self.overViewLayout?.isHidden=false;
    }
    //#MARK: Step 1 Setup handler protocol
    public func setupResponseHandler(handler:ITogglabbleOption){
        self.responseHandler=handler;
    }
    
    //#MARK: Step 2 Initialize Recognizer
    public func setupRecognizer(view:UIView, parentView:UIView){
        
        let hideOverlayView = UITapGestureRecognizer(target: self, action: #selector(self.didHideOverlayView))
        view.addGestureRecognizer(hideOverlayView)
        self.overViewLayout=view;
        self.parentView=parentView;
        
        self.myHide();
    }
    @objc func didHideOverlayView() {
        print("Hide Overlay")
        self.myHide();
    }
    //#MARK Step 3 Intialize buttons with
    func initializeButtons(options:[TogglabbleOptionsVM]){
        self.items=options;
        for option in options{
            let button=UIButton()
            button.setTitle(option.label!, for: .normal)
            button.tag=option.value!;
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor=UIColor.white
            button.translatesAutoresizingMaskIntoConstraints=false
            button.addTarget(self, action: #selector(buttonOnClick), for: .touchDown)

            stackView.addArrangedSubview(button);
        }
    }
    @objc func buttonOnClick(_ sender:UIButton){
        responseHandler!.buttonOnClick(value: sender.tag)
    }
    
}
