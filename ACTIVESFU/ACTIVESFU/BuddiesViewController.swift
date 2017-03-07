//
//  BuddiesViewController.swift
//  Developed by Ryan Brown, Nathan Cheung
//
//  Using the coding standard provided by eure: github.com/eure/swift-style-guide
//
//  Allows the user to view previous buddies he or she has matched with throughout the app's use.
//  this also branches into the chat function where users can chat with matched buddies
//
//  Bugs:
//  Users in the table are all users in the database, not the ones matched to the current user.
//
//
//  Changes:
//
//
//
//
// 
//  Copyright © 2017 CMPT276 Group 10. All rights reserved.

import UIKit

import Firebase
import FirebaseAuth


//MARK: BuddiesViewController


class BuddiesViewController: UITableViewController{
    
    
    //MARK: Internal
    
    
    var cellID = "cellID"
    var userFormatInDatabase = [User]()
    
    func fetchAllBuddiesInDatabase() {
        
        FIRDatabase.database().reference().child("Users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: String] {
                let singleUserInDatabase = User()
                
                // If you use this setter, the app will crash IF the class properties don't exactly match up with the firebase dictionary keys
                singleUserInDatabase.setValuesForKeys(dictionary)
                
                self.userFormatInDatabase.append(singleUserInDatabase)
                
                // This will crash because of background thread, so the dispatch fixes it
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }, withCancel: nil)
    }
    
    func viewUsernameInDatabase() {
        
        let UID = FIRAuth.auth()?.currentUser?.uid
        FIRDatabase.database().reference().child("Users").child(UID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: Any] {
                self.navigationItem.title = dictionary["user"] as? String
            }
        }, withCancel: nil)
    }


    //MARK: UITableViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellID)
        
        viewUsernameInDatabase()
        fetchAllBuddiesInDatabase()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return userFormatInDatabase.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let userInDatabase = userFormatInDatabase[indexPath.row]
        
        tableCell.textLabel?.text = userInDatabase.user
        tableCell.detailTextLabel?.text = userInDatabase.email // Comment this out if we don't want to display the email
        
        return tableCell
    }   
    
    
    //MARK: UserCell
    
    
    class UserCell: UITableViewCell {
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            
            super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        required init?(coder aDecoder: NSCoder) {
            
            fatalError("init(coder:) has not been implemented")
        }
    }
}
