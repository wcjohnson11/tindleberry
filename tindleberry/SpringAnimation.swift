//
//  TindleBerryAnimations.swift
//  tindleberry
//
//  Created by Isis Anchalee on 3/2/16.
//  Copyright © 2016 William Johnson. All rights reserved.
//

import UIKit

@objc public class SpringAnimation: NSObject {
    public class func spring(duration: NSTimeInterval, animations: () -> Void) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            },
            completion: nil
        )
    }
    
    public class func springEaseIn(duration: NSTimeInterval, animations: (() -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            options: .CurveEaseIn,
            animations: {
                animations()
            },
            completion: nil
        )
    }
    
    public class func springEaseOut(duration: NSTimeInterval, animations: (() -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            options: .CurveEaseOut,
            animations: {
                animations()
            }, completion: nil
        )
    }
    
    public class func springEaseInOut(duration: NSTimeInterval, animations: (() -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            options: .CurveEaseInOut,
            animations: {
                animations()
            }, completion: nil
        )
    }
    
    public class func springLinear(duration: NSTimeInterval, animations: (() -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            options: .CurveLinear,
            animations: {
                animations()
            }, completion: nil
        )
    }
    
    public class func springWithDelay(duration: NSTimeInterval, delay: NSTimeInterval, animations: (() -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: delay,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            }, completion: nil
        )
    }
    
    public class func springWithCompletion(duration: NSTimeInterval, animations: (() -> Void)!, completion: (Bool -> Void)!) {
        UIView.animateWithDuration(
            duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            }, completion: { finished in
                completion(finished)
            }
        )
    }
}