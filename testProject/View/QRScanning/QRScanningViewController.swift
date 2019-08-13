//
//  QRScanningViewController.swift
//  testProject
//
//  Created by devops on 13/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import AVFoundation
import MVisaQRParser

class QRScanningViewController: UIViewController {

    @IBOutlet weak var videoArea: UIView!
    @IBOutlet weak var scanningArea: UIView!
    
    
    var session: AVCaptureSession!
    var video = AVCaptureVideoPreviewLayer()
    var output = AVCaptureMetadataOutput()
    lazy var scanRect: CGRect = {
        return self.videoArea.frame
    }()
    
    var scannerqr:QRScannerHelper?;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scannerqr=QRScannerHelper(videoArea: videoArea, ca: scanningArea, responseHandler: self)
        scannerqr?.viewDidLoad(proto: self);
//        initScanSession();
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _session = session {
            _session.startRunning()
        }
    }
    
    func initScanSession() {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authorizationStatus {
        case .authorized:
            print("begin session")
            beginSession()
            break;
        case .notDetermined:
            print("not determined")
            beginSession();
            break
        default:
            print("default break")
            break
        }
    }
    
    
    
    
    
    private func beginSession() {
        //Creating session
        session = AVCaptureSession()
        //Define capture devcie
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        
//        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let captureDevice = deviceDiscoverySession.devices.first
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            // Set the input device on the capture session.
            session.addInput(input)
            let captureMetadataOutput = AVCaptureMetadataOutput()
            session.addOutput(captureMetadataOutput)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        }
        catch
        {
            print ("ERROR")
            return
        }
        defineCaptureArea();
        
        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer.frame = self.videoArea.bounds
        videoPreviewLayer.frame.size.width=self.videoArea.frame.width+50;
        videoArea.layer.addSublayer(videoPreviewLayer)
        [scanningArea].forEach { videoArea.bringSubviewToFront($0) }
        
        setupCaptureArea()
        session.startRunning()
//
//        session.startRunning()
    }
    
    private func defineCaptureArea() {
        let selector = #selector(avCaptureInputPortFormatDescriptionDidChangeNotification)
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil)
    }
    @objc func avCaptureInputPortFormatDescriptionDidChangeNotification(notification: NSNotification) {
        output.rectOfInterest = video.metadataOutputRectConverted(fromLayerRect: scanRect)
    }
    
    private func setupCaptureArea() {
        scanningArea.layer.borderWidth = 2
        scanningArea.layer.borderColor = UIColor.white.cgColor
        scanningArea.backgroundColor = .clear
        let rectOfInterest = video.metadataOutputRectConverted(fromLayerRect: videoArea.frame)
        output.rectOfInterest = rectOfInterest
    }
    
}

extension QRScanningViewController:AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {

    }
    func showErrorPopUp() {
    }
}

extension QRScanningViewController:IQRScannerHelper{
    func setupComplete() {
//        videoArea.bringSubviewToFront(self.view);
//        scanningArea.bringSubviewToFront(self.view)
    }
    
    func successProcessTLV(qrData: QRCodeData) {
        print(qrData.description);
    }
    func error(Error:Any, type:Int) {
        switch type {
        case 1:
            break;
        default:
            break;
        }
    }
}
