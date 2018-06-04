//
//  chatHeader.swift
//  Monch
//
//  Created by Fendy Pierre on 6/2/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//


import UIKit
import Firebase

class ChatController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let messageCellId = "messageCellId"
    let headerId = "headerId"
    let searchBarId = "searhBarId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        setupNavButtons()
        
        //next few lines are to create a cell view.
        
        //register message cells in the view
        collectionView?.register(ChatMessage.self, forCellWithReuseIdentifier: messageCellId)
        
        //register layout design cell in the header view. NOTE: also footer option
        collectionView?.register(ChatHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
    }
    
    
    // displays header cell. To render/display reference size must be declared.
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
//        header.backgroundColor = .red
        
        return header
    }
    
    //to resize header, else it will not dispay
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: 80)
    }
    
    //message cell view sizes by default are 50x50. call this to resize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let size = CGSize(width: width, height: 85)
        return size
        
    }
    
    //changes vertical line spacing of message cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //changes horizontal line spacing of message cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //amount of message  cells being returned
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    //display message cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //declare cell being viewed
        let messageCell = collectionView.dequeueReusableCell(withReuseIdentifier: messageCellId, for: indexPath)
        
        //set cell color
//        messageCell.backgroundColor = .blue


        return messageCell
    }
    
    // to hide status bar
    //override var prefersStatusBarHidden: Bool { return true}
    
    fileprivate func setupNavButtons() {
        
            //tint status bar
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "send2").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleNewMessage))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSettings))
        
        
        let logo = UIImage(named: "monch.png")
        let imageView = UIImageView(image: logo)
        //self.navigationItem.titleView = imageView
    }
    @objc func handleNewMessage(){
    
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }

    @objc func handleSettings(){
    
        let newMessageController = MessageSettingsController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }

}
