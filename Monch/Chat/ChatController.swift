//
//  ChatController.swift
//  Monch
//
//  Created by Fendy Pierre on 6/2/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

import UIKit

class ChatController:  UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    let channelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 0
        view.layer.masksToBounds = true
        return view
    }()
    
    let messageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 0
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .yellow
        setupHeaderContainerView()
        createNewMessageButton()
        messatesettingsButton()
        setNavCenterImage()
        setupMessageContainerView()
    }
    
    fileprivate func createNewMessageButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "send2").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
    }
    
    fileprivate func messatesettingsButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
    }
    
    fileprivate func setNavCenterImage(){
        print(123)
        let logo = UIImage(named: "monch.png")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
    
    func setupHeaderContainerView() {
        let width = view.frame.width
        let height = 60
       view.addSubview(headerContainerView)
        headerContainerView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: 60)
        headerContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerContainerView.backgroundColor = UIColor.red
        
//        messageContainerView.addSubview(messageButton)
//        messageButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width/2, height: 60)
        

    }
    func setupMessageContainerView() {
        let width = view.frame.width
        let height = view.frame.height - (headerContainerView.frame.height + 60 + 110)
        print(height)
        view.addSubview(messageContainerView)
        messageContainerView.anchor(top: headerContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: height)
        messageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageContainerView.backgroundColor = UIColor.blue
        

    }
    
    
}


