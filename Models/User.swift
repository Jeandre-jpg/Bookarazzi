//
//  User.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/28.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct User {
    var userName: String
    var email: String
    var posts: [Post]
    var followers: Int
    var following: Int
    var bio: String
    var imageUrl: String
}
