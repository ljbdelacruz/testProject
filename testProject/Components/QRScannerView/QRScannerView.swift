//
//  QRScannerView.swift
//  testProject
//
//  Created by ljbdelacruz on 14/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//


/*
    How to use this app please see the QRScanningViewController and its storyboard
    Easy as pie how to use this
*/


import UIKit
import MVisaQRParser
import AVFoundation

public protocol IQRScannerView{
    func successReceive(qrData:QRCodeData)
    func failed(error:Error)
}

//MvisaQRParser is required when using this uiview
public class QRScannerView: UIView {
    public let xibname:String="QRScannerView";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var videoArea: UIView!
    @IBOutlet weak var captureArea: UIView!
    @IBOutlet weak var instructionTxt: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    var vcHandler:IQRScannerView?;
    var helpers:QRScannerHelper?;
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
    //initiate this in viewDidLoad
    public func setupView(vcH:IQRScannerView, vc:AVCaptureMetadataOutputObjectsDelegate){
        helpers=QRScannerHelper(videoArea: self.videoArea, ca: self.captureArea, responseHandler: self)
        helpers!.viewDidLoad(proto: vc);
        vcHandler=vcH;
    }
    //initiate this in viewDidAppear in viewController
    public func viewDidAppearInit(){
        helpers!.viewDidAppear();        
    }
    public func setMetaObject(metadataObjects: [AVMetadataObject]){
        self.helpers?.setMetaDataObject(metadataObjects: metadataObjects);
    }
    public func startSession(){
        self.helpers?.continueSession();
    }
}

//Mark: IQScannerHelper
extension QRScannerView:IQRScannerHelper{
    public func successProcessTLV(qrData: QRCodeData) {
        vcHandler?.successReceive(qrData: qrData);
    }
    public func setupComplete() {
//        helpers!.output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        [captureArea, topView, leftView, bottomView, rightView].forEach { videoArea.bringSubviewToFront($0) }
        
    }
    public func error(Error: Any, type: Int) {
    }
}





