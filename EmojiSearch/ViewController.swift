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
    
   // create collection outlets for each group of emoji
    @IBOutlet var happyEmojiBtns: [customizeButton]!
    @IBOutlet var sadEmojiBtns: [customizeButton]!
    @IBOutlet var tiredEmojiBtns: [customizeButton]!
    @IBOutlet var loveEmojiBtns: [customizeButton]!
    @IBOutlet var angryEmojiBtns: [customizeButton]!
    
    var emotionList = ["Happy", "Sad", "Tired", "Love", "Angry"] // use for drop down list
    
    // create dictionary to hold button arrays
    var emojiDict = [String: [UIButton]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true // hide dropdown list on load
        self.view.bringSubviewToFront(dropDownStack)// bring drop down in front of showAll button
        
        // set dictionary values to button collections
        emojiDict["Happy"] = happyEmojiBtns
        emojiDict["Sad"] = sadEmojiBtns
        emojiDict["Tired"] = tiredEmojiBtns
        emojiDict["Love"] = loveEmojiBtns
        emojiDict["Angry"] = angryEmojiBtns
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
        
        
        for (name, group) in emojiDict {// access dictionary
            switch selected {
            case "Happy":
                if name != "Happy" { // access specific groups in dict
                    for button in group { // access each button in array and hide
                        button.isHidden = true
                    }
                }
            default:
                print("Something went wrong.")
            }// end switch
        }// end for loop
        
        /*
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
    */
    }// end function hideEmojis
    
    // show all buttons again
    @IBAction func showAllEmojis(_ sender: UIButton) {
        for group in emojiDict.values { // loop through dictionary's collections
            for button in group { // for each button in collection, unhide
                button.isHidden = false
            }
    }// end showAll function
    
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

