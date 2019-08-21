//
//  ScannerPassportVC.swift
//  testProject
//
//  Created by Lainel John Dela Cruz on 21/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import AVFoundation
import Fusuma


class ScannerPassportVC: UIViewController {
    
    @IBOutlet weak var ljPassportScanner: LJPassportScanner!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ljPassportScanner.setup(parent: self)
    }
    func showImagePicker(){
        let fusuma=FusumaViewController();
        fusuma.delegate = self
        self.show(fusuma, sender: self)
    }
    @IBAction func scanImageOnClick(_ sender: Any) {
        self.showImagePicker();
    }
    
    
}

extension ScannerPassportVC:AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
    }
    func showErrorPopUp() {
        
    }
}

extension ScannerPassportVC:FusumaDelegate{
    func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {
        
    }
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        ljPassportScanner.scanImage(image: image);
    }
    func fusumaVideoCompleted(withFileURL fileURL: URL) {
        
    }
    func fusumaCameraRollUnauthorized() {
        
    }
    
    
}

