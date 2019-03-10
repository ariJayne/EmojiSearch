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
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var displayLbl: UILabel!
    
    // create collection outlets for each group of emoji // will access each individual button by tag assigned in Interface Builder
    @IBOutlet var happyEmojiBtns: [customizeButton]!
    @IBOutlet var sadEmojiBtns: [customizeButton]!
    @IBOutlet var tiredEmojiBtns: [customizeButton]!
    @IBOutlet var loveEmojiBtns: [customizeButton]!
    @IBOutlet var angryEmojiBtns: [customizeButton]!
    
    var emotionList = ["Happy", "Sad", "Tired", "Love", "Angry"] // use for drop down list
    
    var emojiDict = [String: [UIButton]]()// dictionary to hold button outlet collections
    
    // dictionary of messages to respond to user input
    var quoteDict = ["Happy": ["You are awesome!",
                               "Sending you a little box of sunshine to brighten your day!",
                               "You are amazing and strong and brave and wonderful. Remember that today",
                               "Thank you for making me smile"],
                     "Sad":   ["You are stronger than the things that made you weak",
                               "little by little, day by day, what is meant for you will find its way",
                               "You are enough, just as you are",
                               "Love yourself. It's important to stay positive because beauty comes from the inside out"],
                     "Tired": ["today will be a good day so wake up and smile!",
                                "The early bird can have the worm, because worms are gross and mornings are stupid",
                                "Denial, anger, bargainig, depression, acceptance.. the 5 stages of waking up",
                                "Try [another] cup of coffee!"],
                     "Love": ["There is no charm equal to the tenderness of the heart",
                                "When there is love, there is life",
                                "When someone elses happiness is your happiness, that is love",
                                "Spread love everywhere you go. Let no one ever come to you without leaving happier"],
                     "Angry": ["Anger is nothing more than an outward expression of hurt, fear, and frustration",
                                "it's a lot easier to be angry at someone than it is to tell them you're hurt",
                                "try to manage your anger since people can't manage their stupidity",
                                "a moment of patience in a moment of anger prevents a thousand moments of regret"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.isHidden = true // hide dropdown list on load
        self.view.bringSubviewToFront(dropDownStack)// bring dropdown in front of showAll button
        
        // set dictionary values to button collections
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
    
    func animate(toggle: Bool) { // animate and toggle the display of drop down list
        if toggle { // if toggle is true (table is hidden), set to false (unhide)
            UIView.animate(withDuration: 0.3) {// animate creates a short effect when table drops in and out, looks smoother
                self.tblView.isHidden = false
            }
        } else { // if false, set toggle to true (hide table)
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }// end animate function
    
    
    @IBAction func showAllEmojis(_ sender: UIButton) {
        for collection in emojiDict.values { // loop through dictionary's collections
            for button in collection { // unhide all buttons
                button.isHidden = false
            }
        }
    }// end showAll function
    
    func displayEmojiGroup(by selected: String){
        showAllEmojis(showAllBtn)// make sure all emojis are showing before hiding
        
        for (name, collection) in emojiDict { // access dictionary
            for button in collection where name != selected { // access and hide each button in collection except for choice selected by user
                button.isHidden = true
            }
        }
    }// end displayEmojiGroup function
    
    func getQuote(from button: Int) -> String {
        switch button {
        case 1...20: // happy
            if let happyQuote = quoteDict["Happy"] { // need to unwrap since dictionary array value is optional
                return happyQuote.randomElement()! // return a random quote from specified key
            }
        case 21...30: // sad
            if let sadQuote = quoteDict["Sad"] {
                return sadQuote.randomElement()!
            }
        case 31...40: // tired
            if let tiredQuote = quoteDict["Tired"] {
                return tiredQuote.randomElement()!
            }
        case 41...50: // love
            if let loveQuote = quoteDict["Love"] {
                return loveQuote.randomElement()!
            }
        case 51...60: // angry
            if let angryQuote = quoteDict["Angry"] {
                return angryQuote.randomElement()!
            }
        default:
            return "something went wrong"
        }
        
        return "Something went wrong"
    }// end getQuote function
    
    @IBAction func onClickEmojiButtons(_ sender: customizeButton){
        if let emoji = sender.currentTitle { // get emoji from button clicked
            displayLbl.text = "\(emoji)" // display to screen
        }
        
        let quote = getQuote(from: sender.tag)// get quote based on user click, get button id by tag assigned in IB
        
        self.performSegue(withIdentifier: "segue", sender: quote) // display popup // set sender to quote grabbed from getQuote function
        
    }// end onClickEmojiButtons function
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // prepares data for segue before it is displayd to user
        let popup = segue.destination as! PopUpViewController // destination is the VC the segue is going TO // set distination TYPE to the popupVC
        popup.message = sender as! String // set message variable to quote grabbed from getQuote function
        
    }
    
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

