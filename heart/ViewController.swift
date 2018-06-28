//
//  ViewController.swift
//  heart
//
//  Created by Mickael Belhassen on 26/06/2018.
//  Copyright © 2018 EmoonaDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     For this heartbeat exercise, I decided to choose the technique based on the layout by disabling some constraint.
     I gave constraints to the heart at the initial size, and also constraints at a larger size,
     I gave as priority to the constraint of the larger size of the low priority
     */
    
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var rightConstraint: NSLayoutConstraint!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var leftConstraint: NSLayoutConstraint!
    
    var continueAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largeHeart()
    }
    
    func largeHeart() {
        if continueAnimation{
            activeDesactiveConstraint(active: false)
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                self.view.layoutIfNeeded()
        },
            completion: { finished in
                self.smallHeart()
        })
    }
    
    func smallHeart(){
        activeDesactiveConstraint(active: true)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                self.view.layoutIfNeeded()
        },
            completion: { finished in
                if !self.continueAnimation{
                    return
                }
                self.largeHeart()
        })
    }
    
    func activeDesactiveConstraint(active: Bool){
        topConstraint.isActive = active
        rightConstraint.isActive = active
        bottomConstraint.isActive = active
        leftConstraint.isActive = active
    }

    @IBAction func startAndStop(_ sender: UIButton) {
        continueAnimation = !continueAnimation
        
        if continueAnimation {
            largeHeart()
        }
    }
    
}

