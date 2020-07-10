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
import ReplayKit

class CameraClass {
    
    // MARK: Instance
   var caputureSession: AVCaptureSession?
   var videoPreviewLayer: AVCaptureVideoPreviewLayer?
   var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
   var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    
    var screenRecorder = RPScreenRecorder.shared()
    
   
    func initializedCaptureSession(camera: AVCaptureDevice.Position, toBeDisplayAt view: UIView, vc: UIViewController) {
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
    
    /// This function records the streen
    func startLiveRecording() {
        screenRecorder.startRecording { (error) in
            if error != nil {
                print("Error occcured while trying to record screen 📱❌ \(error?.localizedDescription)")
            }
        }
    }
    
    
    /// This function stop recording  the streen
    func stopLiveRecording(completed sucessful: @escaping (RPPreviewViewController)->Void ) {
        screenRecorder.stopRecording { (previewVC, error) in
            guard let previewVC = previewVC else { return }
            // sending preview to vc, just to be send back to the homevc. 
            sucessful(previewVC)
            if let error = error {
                return
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
