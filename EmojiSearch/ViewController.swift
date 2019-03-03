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
    
}

// create extension to fill the dropdown table view
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
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
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
