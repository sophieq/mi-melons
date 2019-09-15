//
//  CameraViewController.swift
//  MiMelons
//
//  Created by Sophie Qin on 2019-09-14.
//  Copyright © 2019 Sophie Qin. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    let button = UIButton(frame:CGRect(x: 0, y: 0, width: 50, height: 100))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("snap", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(takeScreenshot(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    func openCamera() {
        // Setting up the camera
        let captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front) else { return }
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let imageOutput = AVCapturePhotoOutput()
        
        captureSession.addOutput(imageOutput)
        captureSession.startRunning()
    
//        @objc func buttonClicked(sender: UIButton!) {
//        let captureSettings = AVCapturePhotoSettings()
//        let previewPixelType = captureSettings.availablePreviewPhotoPixelFormatTypes.first!
//        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
//                             kCVPixelBufferWidthKey as String: 300,
//                             kCVPixelBufferHeightKey as String: 300,
//        ]
//        captureSettings.previewPhotoFormat = previewFormat
//
//    }
//
//    func buildUI() {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        view.addSubview(button)
//        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//    }
    
    
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
   }
    



    /// Takes the screenshot of the screen and returns the corresponding image
    ///
    /// - Parameter shouldSave: Boolean flag asking if the image needs to be saved to user's photo library. Default set to 'true'
    /// - Returns: (Optional)image captured as a screenshot
    @objc open func takeScreenshot(_ shouldSave: Bool = true) -> UIImage? {
        var screenshotImage :UIImage?
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        return screenshotImage
    }
}
