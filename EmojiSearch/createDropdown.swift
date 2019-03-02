//
//  CreateDropdown.swift
//  EmojiSearch
//
//  Created by Ariana DeJesus on 3/2/19.
//  Copyright © 2019 web151. All rights reserved.
//

import Foundation
import UIKit

class CreateDropdown: UIButton {
    
    // initialize dropdownview class
    var dropView = DropdownView()
    
    var height = NSLayoutConstraint()
    
    // load all button features before its loaded to user
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.darkGray
        
        // put dropview inside the dropdownButton's frame
        dropView = DropdownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // catch error
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // load views and constraints before loading to user
    override func didMoveToSuperview() {
        // add to parent view
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)// shows dropview in front of button when it opens
        
        // set constraints
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true // will have view drop DOWN from button
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false{
            isOpen == true
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 150
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
            }, completion: nil )
            
            } else {
                isOpen == false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 150
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
            }, completion: nil )            }
    }
    
    
}

// create class for the dropdown view
// uiview holds the tableview so you can keep adding to the list if you want to
class DropdownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropOptions = [String]() // holds all the options for user to select.
    
    var tableView = UITableView() // create tableview to hold values    // allows you to create the frame for the dropdown table programatically
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false // allows the constraints to be applied
        
        self.addSubview(tableView)
        
        // set constraints
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    // catches errors if view fails to load
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 1 section of the table view to hold rows
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // get number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropOptions.count // how many rows inside tableview
    }

    // initialize the type of cell inside tableview, nothing fancy
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
    
        // populate cell with items from dropOptions array
        cell.textLabel?.text = dropOptions[indexPath.row]// uses optional chaining to ensure a value is put into the cell
        cell.backgroundColor = UIColor.green
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dropOptions[indexPath.row])
    }

}
