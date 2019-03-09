//
//  ViewController.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 2/23/19.
//  Copyright © 2019 web151. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dropDownStack: UIStackView! // create this outlet to bring this view in front of showAll button
    
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
    
    var emojiDict = [String: [UIButton]]()// dictionary to hold button outlet collections
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.isHidden = true // hide dropdown list on load
        self.view.bringSubviewToFront(dropDownStack)// bring dropdown in front of showAll button
        
        // set dictionary values
        emojiDict["Happy"] = happyEmojiBtns
        emojiDict["Sad"] = sadEmojiBtns
        emojiDict["Tired"] = tiredEmojiBtns
        emojiDict["Love"] = loveEmojiBtns
        emojiDict["Angry"] = angryEmojiBtns
    }
    
    @IBAction func onClickFindEmojiBtn(_ sender: Any) {// reveal/hide dropdown list when user clicks find emoji by group button
        if tblView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if toggle { // if toggle is true (table is invisible), set to false (unhide table)
            UIView.animate(withDuration: 0.3) {// animate creates a short effect when table drops in and out, looks smoother
                self.tblView.isHidden = false
            }
        } else { // if false, set toggle to true (hide table)
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }// end animate function
    
    func displayEmojiGroup(by selected: String){
        showAllEmojis(showAllBtn)// make sure all emojis are showing before hiding
        
        for (name, collection) in emojiDict { // access dictionary
            for button in collection where name != selected { // access each button in collection except for choice selected by user
                button.isHidden = true
            }
        }
    }// end displayEmojiGroup function
    
    @IBAction func showAllEmojis(_ sender: UIButton) {
        for collection in emojiDict.values { // loop through dictionary's collections
            for button in collection { // unhide buttons
                button.isHidden = false
            }
        }
    }// end showAll function
    
}// end class ViewController


// create extension to fill the dropdown table view
// need to connect to viewController delegate/datasource first by ctrl dragging from tableview to viewController
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {// get list of emotions and put into rows
        return emotionList.count // return number of items in list to account for rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)// get identifier for cell
        cell.textLabel?.text = emotionList[indexPath.row]// get item from emotionList array
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {// do stuff when item from table is selected
        let selected = self.emotionList[indexPath.row]// get selected item into a string
        displayEmojiGroup(by: selected)// send selected to function to display specified group of emojis and hide all others
        animate(toggle: false)// close dropdown after item is selected
    }
}

