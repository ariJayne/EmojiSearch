//
//  ViewController.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 2/23/19.
//  Copyright © 2019 web151. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var findEmojiBtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    
   // create collection outlets of each type of button
    @IBOutlet var happyEmojiButtons: [customizeButton]!
    @IBOutlet var sadEmojiButtons: [customizeButton]!
    @IBOutlet var tiredEmojiButtons: [customizeButton]!
    @IBOutlet var loveEmojiButtons: [customizeButton]!
    @IBOutlet var angryEmojiButtons: [customizeButton]!
    
    var emotionList = ["Happy", "Sad", "Tired", "Love", "Angry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.isHidden = true
        
    }
    
    // reveal/hide dropdown list when user clicks find emoji button
    @IBAction func onClickFindEmojiBtn(_ sender: Any) {
        if tblView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    // create function to toggle the dropdown animation
    func animate(toggle: Bool) {
        if toggle { // if toggle is true (table is visible), set to false (hide table)
            UIView.animate(withDuration: 0.3) {
            self.tblView.isHidden = false
            }
        } else { // if false, set toggle to true (make visible)
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }// end function animate
    
    func getEmojis(from selected: String){
        //*********** REFACTOR THIS PART *********
        switch selected {
        case "Happy":
            // set all other buttons to hidden
            sadEmojiButtons.forEach {
                $0.isHidden = true
            }
            
            tiredEmojiButtons.forEach {
                $0.isHidden = true
            }
            loveEmojiButtons.forEach {
                $0.isHidden = true
            }
            angryEmojiButtons.forEach {
                $0.isHidden = true
            }
        case "Sad":
            happyEmojiButtons.forEach {
                $0.isHidden = true
            }
            
            tiredEmojiButtons.forEach {
                $0.isHidden = true
            }
            loveEmojiButtons.forEach {
                $0.isHidden = true
            }
            angryEmojiButtons.forEach {
                $0.isHidden = true
            }
        case "Tired":
            sadEmojiButtons.forEach {
                $0.isHidden = true
            }
            
            happyEmojiButtons.forEach {
                $0.isHidden = true
            }
            loveEmojiButtons.forEach {
                $0.isHidden = true
            }
            angryEmojiButtons.forEach {
                $0.isHidden = true
            }
        case "Love":
            sadEmojiButtons.forEach {
                $0.isHidden = true
            }
            
            tiredEmojiButtons.forEach {
                $0.isHidden = true
            }
            happyEmojiButtons.forEach {
                $0.isHidden = true
            }
            angryEmojiButtons.forEach {
                $0.isHidden = true
            }
        case "Angry":
            sadEmojiButtons.forEach {
                $0.isHidden = true
            }
            
            tiredEmojiButtons.forEach {
                $0.isHidden = true
            }
            loveEmojiButtons.forEach {
                $0.isHidden = true
            }
            happyEmojiButtons.forEach {
                $0.isHidden = true
            }        default:
            print("Something bad happened")
        }
        
    }// end function getEmojis
    
}

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
        
        // hide emojis except group selected
        // link selection to tag number
        let selected = self.emotionList[indexPath.row]
        getEmojis(from: selected)
        animate(toggle: false)// close dropdown after item is selected
    }
}





/*  //represents all button titles
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
 } */
