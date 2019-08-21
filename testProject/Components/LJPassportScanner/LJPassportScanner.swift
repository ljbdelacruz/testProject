//
//  LJPassportScanner.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 21/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyTesseract
import Vision


//requires the CameraComponent Module

class LJPassportScanner: UIView {
    public let xibname:String="LJPassportScanner";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var cameraComp: CameraComponent!
    @IBOutlet weak var scannerObject: UIView!
    
    
    let swiftyTesseract = SwiftyTesseract(language: .english)
    
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
        scannerObject.layer.borderWidth=2;
        scannerObject.layer.borderColor=UIColor.red.cgColor
    }
    func setup(parent:AVCaptureMetadataOutputObjectsDelegate){
        self.cameraComp.startCaputure(handler: self, parent: parent)
        self.cameraComp.output.rectOfInterest=scannerObject.frame;
    }
    func startScanning(){
        
    }

    func scanImage(image:UIImage){
        swiftyTesseract.performOCR(on: image) { recognizedString in
            guard let recognizedString = recognizedString else { return }
            print(recognizedString)
            print("SHITE");
        }
    }
}
extension LJPassportScanner:ICameraComponent{
    func setupComplete() {
        [scannerObject].forEach { cameraComp.videoArea.bringSubviewToFront($0) }
    }
}
