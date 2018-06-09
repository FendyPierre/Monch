//
//  NewMessageController.swift
//  Monch
//
//  Created by Fendy Pierre on 6/4/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationButtons()
        self.navigationItem.title = "Create New Chat"
        fetchUser()
        fetchAllUsers()
    }
    var user: User?
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot.value ?? "")
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            self.user = User(dictionary: dictionary)
            
            self.tableView?.reloadData()
            
        }) { (err) in
            print("Failed to fetch user:", err)
        }
        
    }
    var listOfUsers = [String]()
    var users = [String: Any]()
    func fetchAllUsers(){
        
        Database.database().reference().child("allUsers").observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot.value ?? "")
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            self.users = dictionary
            print("Here are all the KEYS:", self.users.keys)
            self.tableView.reloadData()
            print("Here are All users",dictionary)
            
        }) { (err) in
            print("Failed to fetch user:", err)
        }
        
    }
    fileprivate func setupNavigationButtons() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNext))
    }
    
    @objc func handleNext() {
        print("Handling next")
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    let cellId = "cellId"
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var names = [String]()
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        for keys in self.users.keys{
            print("printing key:", keys)
            names.append(keys)
            
        }
        cell.textLabel?.text = names[indexPath.row]
        print(names)
        return cell
    }
     let searchBar = UISearchBar()
}

