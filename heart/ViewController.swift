//
//  ViewController.swift
//  heart
//
//  Created by Mickael Belhassen on 26/06/2018.
//  Copyright © 2018 EmoonaDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
            self.topConstraint.isActive = false
            self.rightConstraint.isActive = false
            self.bottomConstraint.isActive = false
            self.leftConstraint.isActive = false
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
        topConstraint.isActive = true
        rightConstraint.isActive = true
        bottomConstraint.isActive = true
        leftConstraint.isActive = true
        
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

    @IBAction func startAndStop(_ sender: UIButton) {
        continueAnimation = !continueAnimation
        
        if continueAnimation {
            largeHeart()
        }
    }
    
}

