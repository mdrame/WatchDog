//
//  CameraViewController.swift
//  WatchDog
//
//  Created by Mohammed Drame on 6/30/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import AVFoundation
import FirebaseStorage
import ReplayKit


class CameraViewController: UIViewController {
    
    // Instance
    let cameraClass = CameraClass()
    
    // Outlets
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var liveLabel: UILabel!
    
    // Outlets Customization
    func outletsCustomization() {
        liveLabel.clipsToBounds = true
        liveLabel.layer.cornerRadius = 10
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       outletsCustomization()
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        CameraClass().initializedCaptureSession(camera: .back, toBeDisplayAt: videoView, vc: self)
        cameraClass.startLiveRecording()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        cameraClass.stopLiveRecording { (recordedViewPreview) in
        print(recordedViewPreview)
        }
    }
    
  
    // MARK: Instances
//    let cameraClass = CameraClass()
    
    
    
       
  
}
