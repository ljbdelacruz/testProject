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

    @IBOutlet weak var qrScannerView: QRScannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        qrScannerView.setupView(vcH: self, vc:self);
        qrScannerView.viewDidAppearInit();
    }
}


extension QRScanningViewController:IQRScannerView{
    func successReceive(qrData: QRCodeData) {
        print("Data");
        print(qrData.merchantName);
    }
    func failed(error: Error) {
        
    }
}
extension QRScanningViewController:AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        qrScannerView.helpers!.setMetaDataObject(metadataObjects: metadataObjects);
    }
    func showErrorPopUp() {
        print("Error");
    }
}
