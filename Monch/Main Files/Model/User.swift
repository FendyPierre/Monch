//
//  User.swift
//  Monch
//
//  Created by Fendy MacBook on 6/6/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

struct User {
    
    
    let email: String
    let bio: String
    let username: String
    let profileImageUrl: String
    let name: String
    let foodRank: String
    let userId: String
    let score: String
    var followers = [String]()
    var following = [String]()
    var channelLog = [String]()
    var messageLog = [String]()
    var privateMessaging = Bool()
    
    init(dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"]  as? String ?? ""
        self.name = dictionary["username"] as? String ?? ""
        self.foodRank = dictionary["userId"] as? String ?? ""
        self.userId = dictionary["userId"] as? String ?? ""
        self.score = dictionary["score"] as? String ?? ""
        self.followers = dictionary["followers"] as? [String] ?? [""]
        self.following = dictionary["following"] as? [String] ?? [""]
        self.messageLog = dictionary["messageLog"] as? [String] ?? [""]
        self.channelLog = dictionary["channelLog"] as? [String] ?? [""]
        self.email = dictionary["email"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
        self.privateMessaging = dictionary["privateMessaging"] as? Bool ?? false
        
    }
}

