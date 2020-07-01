//
//  CameraViewController.swift
//  WatchDog
//
//  Created by Mohammed Drame on 6/30/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Outlet
      @IBOutlet weak var videoView: UIView!
      
    
    override func viewWillAppear(_ animated: Bool) {
        CameraClass().switchTo(camera: .back, toBeDisplayAt: videoView, vc: self) { (finished) in
            if finished {
                print("Done Recording. Dismissing back to homevc")
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
  
    // MARK: Instances
//    let cameraClass = CameraClass()
    
    
    
       
  
}
