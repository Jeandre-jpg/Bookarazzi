//
//  FirestoreService.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/30.
//


import SwiftUI
import FirebaseFirestore
import Firebase
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
                "posts": [],
                "followers": 0,
                "following": 0,
                "bio": "",
                "picture": ""
            ]) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                }else {
                    print("Document added successfully")
                }
            }
        }

    
    static func addNewPost(caption: String, imageUrl: String){
            
            db.collection("posts").document().setData([
                "caption": caption,
                "imageUrl": imageUrl,
                "ownerId": Auth.auth().currentUser!.uid,
                "likeCount": 0,
                "date": Date().timeIntervalSince1970
            ]) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document added successfully")
                }
            }
            
        }
    
    static func fetchUser(uid:String,onSuccess:@escaping(_ user:User) -> Void){
            db.collection("users").document(uid).getDocument{(doc,err) in
                guard let user = doc else {return}

                let username = user.data()?["username"] as? String ?? ""
                let picture = user.data()?["picture"] as? String ?? ""
                let bio = user.data()?["bio"] as? String ?? ""
                let email = user.data()?["email"] as? String ?? ""
                let followers = user.data()?["followers"] as? Int ?? 0
                let following = user.data()?["username"] as? Int ?? 0
                //db.collection (fetchPosts) db.collection("posts").where(userId, uid).get()
                //posts: [ var wat jy gefetch het van die collection ]

                print("user fetched")
                onSuccess(User(userName: username, email: email, posts: [], followers: 0, following: 0, bio: bio, imageUrl: picture))
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
                    let userName = document["userName"] as? String ?? "No User"
                    let imageUrl = document["imageUrl"] as? String ?? ""
                    let likeCount = document["likeCount"] as? Int ?? 0
                    let date = document["date"] as? Double ?? 0
                    
                    return Post(postId: queryDocument.documentID, caption: caption, imageUrl: imageUrl, userName: userName, likeCount: likeCount, date: date)
                    
                }
            }
        }
    }
    
}
