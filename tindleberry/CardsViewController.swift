//
//  ViewController.swift
//  tindleberry
//
//  Created by William Johnson on 3/2/16.
//  Copyright © 2016 William Johnson. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet var parentView: UIView!
    var gestureBeginPt: CGPoint?
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBAction func onPhotoPanned(panGestureRecognizer: UIPanGestureRecognizer) {
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            gestureBeginPt = profileImageView.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            let translation = panGestureRecognizer.translationInView(parentView)
            profileImageView.center.x = translation.x
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
        }
    }
    
    func setupImages(){
        profileImageView.image = UIImage(named: "ryan")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

