//
//  PostModel.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//
import Foundation

struct Post: Identifiable{
    var id = UUID()
    var postId: String
    var caption: String
    var ownerId: String
    var likeCount: Int
    var date: Double
    var imageUrl: String
}
