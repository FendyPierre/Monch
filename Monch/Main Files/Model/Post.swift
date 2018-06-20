//
//  Post.swift
//  InstagramFirebase
//
//  Created by Brian Voong on 4/4/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import Foundation

struct Post {
    let imageUrl: String
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
