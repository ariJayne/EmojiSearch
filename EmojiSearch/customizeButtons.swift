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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let color = UIColor.white
        self.layer.cornerRadius = 35
        self.clipsToBounds = true
        self.layer.borderWidth = 5
        self.layer.borderColor = color.cgColor
    }
}// end class
