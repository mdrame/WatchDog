//
//  ViewController.swift
//  WatchDog
//
//  Created by Mohammed Drame on 6/3/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewCalls()
    }
    
    // MARK: Instances
    
    
    // MARK: Views Functions
    /// Contain the following: 1. Delegate & DataSource
    func collectionViewCalls() {
        cardCustomeCollectionView.delegate = self
        cardCustomeCollectionView.dataSource = self
    }
    

   
    
    // MARK: Outlets
    @IBOutlet weak var cardCustomeCollectionView: UICollectionView!
    
    // MARK: Actions
    @IBAction func record(_ sender: UIButton) {
         let cameraStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let cameraVC = cameraStoryBoard.instantiateViewController(identifier: "cameraVC") as? CameraViewController else { return }
        present(cameraVC, animated: true, completion: nil)
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: DataSources
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
        return customCardCell
    }
    
    // MARK: Delegates
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: collectionView.frame.size.height - 10)
    }
    
    
    
    
    
}

