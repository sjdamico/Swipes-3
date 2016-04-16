//
//  ViewController.swift
//  Swipes
//
//  Created by Steve D'Amico on 4/14/16.
//  Copyright © 2016 Steve D'Amico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    private var gestureStartPoint: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        for var touchCount = 1; touchCount <= 5; touchCount++ {
            let vertical = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
            vertical.direction = [.Up, .Down]
            vertical.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(vertical)
            
            let horizontal = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
            horizontal.direction = [.Left, .Right]
            horizontal.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(horizontal)
        }
    }
    
    func descriptionForTouchCount(touchCount:Int) -> String {
        switch touchCount {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }
    
    func reportHorizontalSwipe(recognizer:UIGestureRecognizer) {
        let count = descriptionForTouchCount(recognizer.numberOfTouches())
        label.text = "\(count)-finger horizontal swipe detected"
    }

    func reportVerticalSwipe(recognizer:UIGestureRecognizer) {
        let count = descriptionForTouchCount(recognizer.numberOfTouches())
        label.text = "\(count)-finger vertical swipe detected"
    }
}

