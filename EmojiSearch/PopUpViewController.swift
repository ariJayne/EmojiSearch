//
//  PopUpViewController.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 3/9/19.
//  Copyright © 2019 web151. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var popupMessage: UILabel!
    @IBOutlet weak var goBack: UIButton!
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       popupMessage.text = message// display message from main view controller
    }
    
    @IBAction func closePopup(_ sender: Any) {
       self.dismiss(animated: true)
    }
    
}// end class
