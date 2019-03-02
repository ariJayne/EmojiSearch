//
//  customizeButtons.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 2/28/19.
//  Copyright © 2019 web151. All rights reserved.
//

import Foundation
import UIKit

class customizeButton: UIButton {
    
    override func awakeFromNib() {// ensures the appearance of button is loaded before the view is loaded to the user
        super.awakeFromNib()    // awakefromnib runs only after connections are made to it
        
        let color = UIColor.white
        self.layer.cornerRadius = 36.5
        self.clipsToBounds = true
        self.layer.borderWidth = 5
        self.layer.borderColor = color.cgColor
    }
}// end class
