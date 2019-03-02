//
//  ViewController.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 2/23/19.
//  Copyright © 2019 web151. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dropdownButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func handleSelectedButton(_ sender: UIButton) {
        // unhide buttons when selected
        dropdownButtons.forEach { (button) in
            //add an animation
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded() // makes dropdown come from selector button
            })
        }
    }
    //represents all button titles
    enum Emotions: String {
        case happy = "Happy"
        case sad = "Sad"
        case love = "Love"
        case anger = "Anger"
    }
    @IBAction func emotionSelected(_ sender: UIButton) {
        // get current title for button tapped in order to do stuff with the selection
        guard let title = sender.currentTitle, let emotion = Emotions(rawValue: title) else{
            return
        }
        
        switch emotion {
        case .happy:
            print("happy")
        default:
            print("nice")
        }
    }
}

