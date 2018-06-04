//
//  ChatController.swift
//  Monch
//
//  Created by Fendy Pierre on 6/2/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

import UIKit

class ChatHeader:  UICollectionViewCell{
    
    let searchBar = UISearchBar()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  Message ", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0
        button.layer.cornerRadius = 0
        return button
    }()
    let channelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(" Channel ", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0
        button.layer.cornerRadius = 0
        return button
    }()
    
    fileprivate func setupHeader() {
        let stackView = UIStackView(arrangedSubviews: [messageButton, channelButton])
        
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left:leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        let verticalDividerView = UIView()
        verticalDividerView.backgroundColor = UIColor.lightGray
        
        addSubview(verticalDividerView)
        verticalDividerView.anchor(top: topAnchor, left: messageButton.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 1, height: 30)
        
        addSubview(searchBar)
        searchBar.anchor(top: messageButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30)
        searchBar.searchBarStyle = .minimal
    }
    
    //how view cells are initialized
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
