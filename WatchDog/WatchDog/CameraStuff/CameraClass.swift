//
//  CameraClass.swift
//  WatchDog
//
//  Created by Mohammed Drame on 6/30/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraClass {
    
    // MARK: Instance

   var caputureSession: AVCaptureSession?
   var videoPreviewLayer: AVCaptureVideoPreviewLayer?
   var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
   var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
   
    func switchTo(camera: AVCaptureDevice.Position, toBeDisplayAt view: UIView, vc: UIViewController, completionHandler: (_: Bool)->Void) {
       if #available(iOS 10.2, *) {
           let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: camera)
           do {
               let input = try AVCaptureDeviceInput(device: captureDevice!)
               caputureSession = AVCaptureSession()
               caputureSession?.addInput(input)
               videoPreviewLayer = AVCaptureVideoPreviewLayer(session: caputureSession!)
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
               caputureSession?.startRunning()
           } catch {
               print("❌: \(error.localizedDescription)")
           }
       }
   }
 
// func switchToFront() {
//        if backCamera?.isConnected == true {
//            caputureSession?.stopRunning()
//            switchTo(camera: .front, toBeDisplayAt: <#UIView#>)
//        } else {
//            switchTo(camera: .front, toBeDisplayAt: <#UIView#>)
//        }
//    }
//
//    func switchToBackCamera() {
//        if frontCamera?.isConnected == true {
//            caputureSession?.stopRunning()
//            switchTo(camera: .back, toBeDisplayAt: <#UIView#>)
//        } else {
//            switchTo(camera: .back, toBeDisplayAt: <#UIView#>)
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
