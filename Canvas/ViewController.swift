//
//  ViewController.swift
//  Canvas
//
//  Created by Will Gilman on 4/19/17.
//  Copyright © 2017 Will Gilman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var deadImageView: UIImageView!
    @IBOutlet weak var excitedImageView: UIImageView!
    @IBOutlet weak var happyImageView: UIImageView!
    @IBOutlet weak var sadImageView: UIImageView!
    @IBOutlet weak var tongueImageView: UIImageView!
    @IBOutlet weak var winkImageView: UIImageView!
    @IBOutlet weak var downArrowImageView: UIImageView!
    
    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        trayCenterWhenOpen = trayView.center
        trayCenterWhenClosed = CGPoint(x: trayView.center.x, y: trayView.center.y + 210.0)
    }

    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        // let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
            print("Gesture began at: \(location)")
            trayOriginalCenter = trayView.center
            
        } else if sender.state == .changed {
            
            print("Gesture changed at: \(location)")
            
            let velocity = sender.velocity(in: trayView)
            
            if velocity.y < 0 {
                
                trayView.center = trayCenterWhenOpen
            
            } else {
                
//                trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
                trayView.center = trayCenterWhenClosed
            }
            
        } else if sender.state == .ended {
            
            print("Gesture ended at: \(location)")
        }
    }

}

