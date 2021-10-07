//
//  FirestoreService.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/30.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static var db = Firestore.firestore()
    
    static func getUserId(userId: String)-> DocumentReference {
        return db.collection("users").document(userId)
    }
    
    static func addNewUser(uid: String, username: String, email: String){
        db.collection("users").document(uid).setData([
                "username": username,
                "email": email,]){
            
            error in
            if let error = error{
                print("Error writing document: \(error)")
            }else{
                print("Documnet Successfully written!")
            }
        }
    }
    
    static func addNewPost(caption: String, imageUrl: String){
        db.collection("posts").document().setData([
                "caption": caption,
                "imageUrl": imageUrl,
                "ownerId": Auth.auth().currentUser!.uid,
                "likeCount": 0,
                "date": Date().timeIntervalSince1970,
        ]){
            
            error in
            if let error = error{
                print("Error writing document: \(error)")
            }else{
                print("Documnet added Successfully")
            }
        }
    }
    
}
