//
//  DraggableImageView.swift
//  tindleberry
//
//  Created by William Johnson on 3/2/16.
//  Copyright © 2016 William Johnson. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    var gestureBeginPt: CGPoint?

    @IBAction func onPhotoPanned(panGestureRecognizer: UIPanGestureRecognizer) {
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            gestureBeginPt = profileImageView.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            let translation = panGestureRecognizer.translationInView(contentView)
            profileImageView.center.x = translation.x
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
        }
    }

    var image: UIImage? {
        get { return profileImageView.image}
        set { profileImageView.image = newValue}
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()

        
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
