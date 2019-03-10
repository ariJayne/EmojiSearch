//
//  PopUpViewController.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 3/9/19.
//  Copyright © 2019 web151. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 1, alpha: 0.3) // set transparent background
        self.showAnimate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func closePopup(_ sender: Any) {
        self.removeAnimate()
    }
    
    // popup animation - courtesy of Youtuber: Seemu Apps -- video: Swift- Pop Up Tutorial
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3) // makes view larger
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: { // will scale down when view appears
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        })
    }
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3) // makes view larger as it removes it from screen
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        })
    }
}// end class
