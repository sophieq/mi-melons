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
    let imageView = UIImageView(frame: CGRect(x: 57, y: 260, width: 268, height: 268))
    let traceImageView = UIImageView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 500))
    let button = UIButton(frame: CGRect(x: 21, y: 700, width: 333, height: 59))
    let closeButton = UIButton()
    @objc var onTap:(()->())? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        openCamera()
        buildUI()
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
    }
    
    
    func buildUI() {
        
        view.addSubview(button)
        button.backgroundColor = UIColor(red: 190/255, green: 206/255, blue: 139/255, alpha: 1)
        button.setTitle("I'm done!", for: .normal)
        button.addTarget(self, action: #selector(getter: onTap), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor(red: 190/255, green: 206/255, blue: 139/255, alpha: 0.39).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 7)
        button.layer.shadowRadius = 15 / 2
        
        let image: UIImage = UIImage(named: "circle")!
        let tintedImage = image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        imageView.image = tintedImage
        view.addSubview(imageView)
        
        let trace = UIImage(named: "wave")!
        traceImageView.image = trace
        traceImageView.contentMode = .scaleToFill
        view.addSubview(traceImageView)
    }

}
