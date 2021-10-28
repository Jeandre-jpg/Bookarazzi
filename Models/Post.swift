//
//  Post.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/28.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct Post: Identifiable{
    var id = UUID()
    var postId: String
    var caption: String
    var imageUrl: String
    var userName: String
    var likeCount: Int
    var date: Double
}
