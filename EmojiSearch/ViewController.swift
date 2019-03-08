//
//  ViewController.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 2/23/19.
//  Copyright © 2019 web151. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dropDownStack: UIStackView!
    /* tag each button in Interface Builder
     1-4 : happy
     5-8 : sad
     9- 12: tired
     13 - 16 : love
     17 - 20 : angry
     */
    
    @IBOutlet weak var findEmojiBtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var showAllBtn: UIButton!
    
    @IBOutlet var emojiButtons: [customizeButton]! // collection outlet for emoji buttons
    
    var emotionList = ["Happy", "Sad", "Tired", "Love", "Angry"] // use for drop down list
    
    // create empty arrays to hold button groups
    var happyButtons: [UIButton] = []
    var sadButtons: [UIButton] = []
    var tiredButtons: [UIButton] = []
    var loveButtons: [UIButton] = []
    var angryButtons: [UIButton] = []
    
    // create dictionary to hold button arrays
    var emojiDict = [String: [UIButton]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true // hide dropdown list on load
        self.view.bringSubviewToFront(dropDownStack)// bring drop down in front of showAll button
        
    }
    
    // reveal/hide dropdown list when user clicks find emoji by group button
    @IBAction func onClickFindEmojiBtn(_ sender: Any) {
        if tblView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    // create function to toggle the dropdown
    func animate(toggle: Bool) {
        if toggle { // if toggle is true (table is invisible), set to false (unhide table)
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = false
            }
        } else { // if false, set toggle to true (hide table)
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }// end function animate
    
    func hideEmojis(by selected: String){
        // make sure all emojis are showing before hiding
        showAllEmojis(showAllBtn)
        
        // get button tags and assign to array group
        for i in 1...20 {
            if let button = self.view.viewWithTag(i) as? UIButton {// get button by tag and append to proper array
                switch i {
                case 1...4:
                    happyButtons.append(button)
                case 5...8:
                    sadButtons.append(button)
                case 9...12:
                    tiredButtons.append(button)
                case 12...16:
                    loveButtons.append(button)
                case 17...20:
                    angryButtons.append(button)
                default:
                    print("something went wrong")
                }// end switch
            }// end optional binding
        }// end for loop
        
        // then add arrays to dictionary where the key is string from emotionList
        emojiDict["Happy"] = happyButtons
        emojiDict["Sad"] = sadButtons
        emojiDict["Tired"] = tiredButtons
        emojiDict["Love"] = loveButtons
        emojiDict["Angry"] = angryButtons
        
        // access dictionary key by selected, hide buttons not selected
        switch selected {
        case "Happy":
            for (name, group) in emojiDict { // get key/value pair from dict
                if name != "Happy" { // access specific groups in dict
                    for button in group { // access each button in array and hide
                        button.isHidden = true
                    }
                }
            }
        case "Sad":
            for (name, group) in emojiDict {
                if name != "Sad" {
                    for button in group {
                        button.isHidden = true
                    }
                }
            }
        case "Tired":
            for (name, group) in emojiDict {
                if name != "Tired" {
                    for button in group {
                        button.isHidden = true
                    }
                }
            }
        case "Love":
            for (name, group) in emojiDict {
                if name != "Love" {
                    for button in group {
                        button.isHidden = true
                    }
                }
            }
        case "Angry":
            for (name, group) in emojiDict {
                if name != "Angry" {
                    for button in group {
                        button.isHidden = true
                    }
                }
            }
        default:
            print("something went wrong")
        }
    }// end function hideEmojis
    
    // show all buttons again
    @IBAction func showAllEmojis(_ sender: UIButton) {
        for button in emojiButtons {
            button.isHidden = false
        }
    }
    
    
}// end class ViewController

// create extension to fill the dropdown table view
// need to connect to viewController delegate/datasource first by ctrl dragging from tableview to viewController
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // get list of emotions and put into rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return emotionList.count // return number of items in list to account for rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)// get identifier for cell
        cell.textLabel?.text = emotionList[indexPath.row]// get item from emotionList array
        return cell
    }
    
    // do stuff when item is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = self.emotionList[indexPath.row]// get selected item into as a string
        hideEmojis(by: selected)// send to function to display group of emojis
        animate(toggle: false)// close dropdown after item is selected
    }
}

