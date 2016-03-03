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
    @IBOutlet weak var profileImageView: DraggableImageView!
    
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
