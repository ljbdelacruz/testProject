//
//  CameraComponent.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 21/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import AVFoundation

protocol ICameraComponent {
    func setupComplete();
}
class CameraComponent: UIView {
    public let xibname:String="CameraComponent";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var videoArea: UIView!
    public var session: AVCaptureSession!
    public var video = AVCaptureVideoPreviewLayer()
    public var output = AVCaptureMetadataOutput()
    public var handler:ICameraComponent?;
    
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
    public func startCaputure(handler:ICameraComponent, parent:AVCaptureMetadataOutputObjectsDelegate){
        self.handler=handler;
        self.setup(parent: parent)
    }
    func setup(parent:AVCaptureMetadataOutputObjectsDelegate){
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authorizationStatus {
        case .authorized:
            //begin session
            beginSession(parent:parent)
            break;
        case .notDetermined:
            //not allowed in permission
            beginSession(parent:parent)
            break
        default:
            //unspecified
            break
        }
    }
    func beginSession(parent:AVCaptureMetadataOutputObjectsDelegate){
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
//            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            //            output.metadataObjectTypes = supportedCodeTypes
            output.setMetadataObjectsDelegate(parent, queue: DispatchQueue.main)
            video = AVCaptureVideoPreviewLayer(session: session)
            video.videoGravity = AVLayerVideoGravity.resizeAspectFill
            video.frame = self.videoArea.bounds
            video.frame.size.width=self.videoArea.frame.width;
            videoArea.layer.addSublayer(video)
            session.startRunning()
            handler!.setupComplete();
        }
        catch
        {
            print ("ERROR")
            return
        }
    }
    
    func startRunning(){
        if let _session = session {
            _session.startRunning()
        }
    }
    func stopSession(){
        session.stopRunning();
    }
    
}
