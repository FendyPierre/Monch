//
//  ChatController.swift
//  Monch
//
//  Created by Fendy Pierre on 6/2/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

import UIKit

class ChatHeader:  UICollectionViewCell{
    
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
        stackView.anchor(top: topAnchor, left:leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
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
