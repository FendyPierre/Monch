//
//  chatMessage.swift
//  Monch
//
//  Created by Fendy Pierre on 6/3/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

import UIKit
import Firebase

class ChatMessage:  UICollectionViewCell{
    
    var user: User? {
        didSet {
            //use this to retrieve information from user object
            
            
            //usernameLabel.text = user?.username
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    fileprivate func setupProfileImage() {
        
        guard let profileImageUrl = user?.profileImageUrl else { return }
        print("profile image name:", profileImageUrl)
        Storage.storage().reference().child("profile_images").child(profileImageUrl).getData(maxSize:1024*1024) { data, error in
            if let error = error {
                print("Error \(error)")
            }
            guard let image = UIImage(data: data!) else {return}
            self.profileImageView.image = image
        }
    }
    
    let friendNameLabel: UILabel = {
        let friendName = "Friend Name"
        let label = UILabel()
        label.text = friendName
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let lastMessageLabel: UILabel = {
        let lastMessage = "This is the last message you or your friend sent in that"
        let label = UILabel()
        label.text = lastMessage
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let friendRankLabel: UILabel = {
        let friendRank = "Food Connoisseur"
        let label = UILabel()
        label.text = friendRank
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    
    //how view cells are initialized
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMessageCell()
    }
    
    func setupMessageCell(){
    let pwidth = CGFloat(70)
    let padding = (frame.height - pwidth)/2
    let end = (padding * 2) + pwidth
    
    addSubview(profileImageView)
    profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: padding, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: pwidth, height: pwidth)
    profileImageView.layer.cornerRadius = pwidth / 2
    profileImageView.clipsToBounds = true
    profileImageView.layer.borderWidth = 1
    profileImageView.layer.borderColor = UIColor.rgb(red: 0, green: 0, blue: 0).cgColor

    let bottomDividerView = UIView()
    bottomDividerView.backgroundColor = UIColor.lightGray
    
    addSubview(bottomDividerView)
        bottomDividerView.anchor(top: bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: end, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
    addSubview(friendNameLabel)
        friendNameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: 0, height: 10)
        
    addSubview(lastMessageLabel)
        lastMessageLabel.anchor(top: friendNameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: 0, height: 10)
    addSubview(friendRankLabel)
        friendRankLabel.anchor(top: lastMessageLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: 0, height: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
