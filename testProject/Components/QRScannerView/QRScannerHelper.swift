//
//  QRScanner.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 12/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
//this module is required when using this helper
import MVisaQRParser


public protocol IQRScannerHelper{
    func successProcessTLV(qrData:QRCodeData)
    func successGetTLV(tlv:String)
    func setupComplete()
    func error(Error:Any, type:Int);
}


public class QRScannerHelper{
    public var session: AVCaptureSession!
    public var video = AVCaptureVideoPreviewLayer()
    public var output = AVCaptureMetadataOutput()
    public var scanEnabled: Bool? = false
    public var responseHandler:IQRScannerHelper?
    var videoArea:UIView;
    var captureArea:UIView;
    var scanRect: CGRect?
    //#Step1 init this
    init(videoArea:UIView, ca:UIView, responseHandler:IQRScannerHelper){
//        self.scanRect=videoArea.frame;
        self.videoArea=videoArea;
        self.captureArea=ca;
        self.responseHandler=responseHandler;
        self.scanRect=videoArea.frame;
    }
    
    
    //#Step2 setup this in viewDidLoad
    func viewDidLoad(proto:AVCaptureMetadataOutputObjectsDelegate){
        #if (arch(i386) || arch(x86_64)) && os(iOS)
        print("WARNING: Camera not available in the simulator!")
        #else
        initAppStateObserver()
        setupCamera(proto: proto)
        #endif
    }
    //#Step3 setup this in viewDidAppear
    func viewDidAppear(){
        if let _session = session {
            _session.startRunning()
        }
    }
    
    
    
    func setupCamera(proto:AVCaptureMetadataOutputObjectsDelegate){
        self.initScanSession(proto: proto);
        self.initToggleTorchButton();
        
    }
    private func initToggleTorchButton() {
//        torchToggleImageView.cornerRadius = 4
//        torchToggleButton.imageView?.contentMode = .scaleToFill
//        toggleTorchToggleButtonIcon(false)
    }
    
    private func initAppStateObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    @objc func appMovedToForeground() {
//        if QRCodeScannerVC.storedTorchStatusIsOn && isViewLoaded && view.window != nil {
//            torchToggle(torchToggleButton)
//        }
    }
    
    func initScanSession(proto:AVCaptureMetadataOutputObjectsDelegate) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authorizationStatus {
        case .authorized:
            //begin session
            beginSession(parent: proto)
            break;
        case .notDetermined:
            //not allowed in permission
            beginSession(parent: proto)
            break
        default:
            //unspecified
            break
        }
    }
    
    private func beginSession(parent:AVCaptureMetadataOutputObjectsDelegate) {
        //Creating session
        session = AVCaptureSession()
        //Define capture devcie
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
            output = AVCaptureMetadataOutput()
            session.addOutput(output)
            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
//            output.metadataObjectTypes = supportedCodeTypes
            output.setMetadataObjectsDelegate(parent, queue: DispatchQueue.main)
            defineCaptureArea();
            video = AVCaptureVideoPreviewLayer(session: session)
            video.videoGravity = AVLayerVideoGravity.resizeAspectFill
            video.frame = self.videoArea.bounds
            video.frame.size.width=self.videoArea.frame.width+50;
            videoArea.layer.addSublayer(video)
            session.startRunning()
            self.setupCaptureArea()
            self.responseHandler?.setupComplete();
        }
        catch
        {
            print ("ERROR")
            return
        }
        
    }
    
    
    private func defineCaptureArea() {
        let selector = #selector(avCaptureInputPortFormatDescriptionDidChangeNotification)
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil)
    }
    @objc func avCaptureInputPortFormatDescriptionDidChangeNotification(notification: NSNotification) {
        output.rectOfInterest = video.metadataOutputRectConverted(fromLayerRect: scanRect!)
    }
    private func setupCaptureArea() {
        captureArea.layer.borderWidth=2;
        captureArea.layer.borderColor=UIColor.white.cgColor;
        captureArea.backgroundColor = .clear
        let rectOfInterest = video.metadataOutputRectConverted(fromLayerRect: captureArea.frame)
        output.rectOfInterest = rectOfInterest
    }
    
    // set this on metadataOutput so you can scan qr codes
    func setMetaDataObject(metadataObjects: [AVMetadataObject]){
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    session.stopRunning()
                    self.responseHandler?.successGetTLV(tlv: object.stringValue!);
                    parse(tlv: object.stringValue!)
                }
            }
        }
    }
    
    //pluginize this part also since this qr parser only support visa qr parsing
    func parse(tlv:String){
        //in order for this to work compile this in xcode 10 compiling it on xcode 10.2 does not seem to work and shit like that due to swift 5.0 compilation
        QRCodeParser.parseQRData(qrCodeString: tlv) { (parserResponse) in
            if let r = parserResponse!.qrCodeData {
                print("QR Code Data: \n" + r.description + "\n")
                if r.mVisaMerchantID == nil {
                    responseHandler?.error(Error:parserResponse!.qrCodeError, type:1);
                } else {
                    responseHandler?.successProcessTLV(qrData: r);
                }
            } else {
//                print("Error Code: \n" + parserResponse!.qrCodeError!.description + "\n")
                responseHandler?.error(Error:parserResponse!.qrCodeError, type:1);
            }
        }
        
    }
    func continueSession(){
        session.startRunning();
    }
    func stopSession(){
        session.stopRunning();
    }
}
