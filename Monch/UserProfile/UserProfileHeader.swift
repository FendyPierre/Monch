//
//  UserProfileHeader.swift
//  Monch
//
//  Created by fendypierre on 5/26/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//


import UIKit
import Firebase

class UserProfileHeader: UICollectionViewCell {
    
    var user: User? {
        didSet {
            guard let profileImageUrl = user?.profileImageUrl else  {return}
            //use this to retrieve information from user object
            profileImageView.loadImage(urlString: profileImageUrl)
            //setupProfileImage()
            
            //usernameLabel.text = user?.username
        }
    }
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        return iv
    }()
    
    let foodButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        return button
    }()
    
    let restaurantButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let badgeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
//    let usernameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "username"
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        return label
//    }()
    
    let foodScoreLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "11\n", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 12)])
        
        attributedText.append(NSAttributedString(string: "Score", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let foodRankLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Food Connoisseur\n", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 12)])
        
        attributedText.append(NSAttributedString(string: "Rank", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "0\n", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 12)])
        
        attributedText.append(NSAttributedString(string: "following", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Welcome  to Munch! Please tell us about the food you love!",
                            attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)])
        
//        label.layer.backgroundColor = UIColor.rgb(red: 211, green: 211, blue: 211).cgColor
        label.attributedText = attributedText
        
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("    Edit Profile    ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        //button.layer.cornerRadius = 0
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("    settings    ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 0
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 90, height: 90)
        profileImageView.layer.cornerRadius = 90 / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.rgb(red: 0, green: 0, blue: 0).cgColor

        setupBottomToolbar()
        setupUserStatsView()

        addSubview(foodRankLabel)
        foodRankLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(editProfileButton)
        editProfileButton.anchor(top: foodScoreLabel.bottomAnchor, left: profileImageView.rightAnchor , bottom: nil, right: nil, paddingTop: -5, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        editProfileButton.layer.cornerRadius = 5
        
        addSubview(settingsButton)
        settingsButton.anchor(top: foodScoreLabel.bottomAnchor, left: editProfileButton.rightAnchor , bottom: nil, right: nil, paddingTop: -5, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        settingsButton.layer.cornerRadius = 5
        addSubview(bioLabel)
        bioLabel.anchor(top: editProfileButton.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 30, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
    }
    
    fileprivate func setupUserStatsView() {
        let stackView = UIStackView(arrangedSubviews: [foodScoreLabel, followingLabel])
        
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 50)
    }
    
    fileprivate func setupBottomToolbar() {
        
        let topDividerView = UIView()
        topDividerView.backgroundColor = UIColor.lightGray
        
        let bottomDividerView = UIView()
        bottomDividerView.backgroundColor = UIColor.lightGray
        
        let stackView = UIStackView(arrangedSubviews: [foodButton, restaurantButton, badgeButton])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        addSubview(topDividerView)
        addSubview(bottomDividerView)
        
        stackView.anchor(top: nil, left: leftAnchor, bottom: self.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        topDividerView.anchor(top: stackView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        bottomDividerView.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    fileprivate func setupProfileImage() {
        
     
        guard let profileImageUrl = user?.profileImageUrl else { return }
        print("profile image name:", profileImageUrl)
        
        guard let url = URL(string: profileImageUrl) else { return }
        
        Storage.storage().reference().child("profile_images").child(profileImageUrl).getData(maxSize:1024*1024) { data, error in
            if let error = error {
                print("Error \(error)")
            }
            guard let image = UIImage(data: data!) else {return}
            self.profileImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

