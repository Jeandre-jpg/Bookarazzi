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
            
            err in
            if let err = err{
                print("Error writing document: \(err)")
            }else{
                print("Documnet Successfully written!")
            }
        }
    }
    
}
