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
        fetchUser()
    }
    var user: User?
    fileprivate func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot.value ?? "")
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            self.user = User(dictionary: dictionary)
            //self.navigationItem.title = self.user?.username
            self.tableView.reloadData()
            
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
        return 5
    }
    
    let cellId = "cellId"
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = self.user?.name
        return cell
    }
     let searchBar = UISearchBar()
}

