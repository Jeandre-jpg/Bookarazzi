//
//  FirestoreService.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/30.
//


import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FirestoreService: ObservableObject {
    
    static var db = Firestore.firestore()
    
    static func getUserId(userId: String) -> DocumentReference {
        return db.collection("users").document(userId)
    }
    
    static func addNewUser(uid: String, username: String, email: String){
        db.collection("users").document(uid).setData([
                "username": username,
                "email": email,
                ]){
            
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
    
    @Published var posts = [Post]()
    
    func fetchAllPost() {
        FirestoreService.db.collection("posts").getDocuments{
            (QuerySnapshot, error) in
            
            if let error = error{
                print(error)
            }else{
                self.posts = QuerySnapshot!.documents.map{ (queryDocument) -> Post in
                    
                    let document = queryDocument.data()
                    let caption = document["caption"] as? String ?? "No Caption"
                    let ownerID = document["ownerId"] as? String ?? "No User"
                    let imageUrl = document["caption"] as? String ?? ""
                    let likeCount = document["likeCount"] as? Int ?? 0
                    let date = document["date"] as? Double ?? 0
                    
                    return Post(postId: queryDocument.documentID, caption: caption, ownerId: ownerID, likeCount: likeCount, date: date, imageUrl: imageUrl)
                    
                }
            }
        }
    }
    
}
