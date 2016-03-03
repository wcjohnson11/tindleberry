//
//  DraggableImageView.swift
//  tindleberry
//
//  Created by William Johnson on 3/2/16.
//  Copyright © 2016 William Johnson. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}

class DraggableImageView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    var gestureBeginPt: CGPoint?


    @IBAction func onPhotoPanned(panGestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGestureRecognizer.translationInView(contentView)
        var location = panGestureRecognizer.locationInView(contentView)
        var rotation = translation.x / 10 * CGFloat(M_PI / 180)
        
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            if location.y > gestureBeginPt!.y {
                rotation = -rotation
            }
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            self.profileImageView.center.y = gestureBeginPt!.y + translation.y
            self.profileImageView.center.x = gestureBeginPt!.x + translation.x
            self.profileImageView.transform = CGAffineTransformMakeRotation(rotation)
            
            
            profileImageView.center.x = translation.x
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if translation.x > 50 {
                UIView.animateWithDuration(0.3, animations: {
                    self.profileImageView.center.x += self.contentView.frame.width
                    }, completion: nil)
                
            } else if translation.x < -50 {
                UIView.animateWithDuration(0.3, animations: {
                    self.profileImageView.center.x -= self.contentView.frame.width
                    }, completion: nil)
                
            } else {
                UIView.animateWithDuration(0.3, animations: {
                    self.profileImageView.center = self.gestureBeginPt!
                    self.profileImageView.transform = CGAffineTransformIdentity
                    }, completion: nil)
            }
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
    
    func acceptAnimation() {
    }
    
    func rejectAnimation() {
        
        let scale = CGAffineTransformMakeScale(1, 1)
        let translate = CGAffineTransformMakeTranslation(0, 0)
        self.profileImageView.transform = CGAffineTransformConcat(scale, translate)
        
        SpringAnimation.springWithCompletion(0.75, animations: {
            
            let rotate = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
            let translate = CGAffineTransformMakeTranslation((-375), 0)
            self.profileImageView.transform = CGAffineTransformConcat(rotate, translate)
            
            }, completion: { finished in 0

        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    override func awakeFromNib() {
        gestureBeginPt = profileImageView.center
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
