//
//  StorageService.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/30.
//

import SwiftUI
import Firebase
import FirebaseStorage

class StorageService {
    
    
    static var storage = Storage.storage()
    
 
    static var storageRoot = storage.reference()
    
 
    static var storagePost = storageRoot.child("posts")
    
 
    static func savePost (caption: String, image: UIImage, onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void){
        
        //Waar jy post create, kry die username van UserDefaults en save dit saam met die post in firestore (soos ons gedoen het met die userId in klas)
     
        let fileName = storagePost.child(Date().description)
        
   
        if let imageData = image.jpegData(compressionQuality: 1){
            
            fileName.putData(imageData, metadata: nil){
                (_, error) in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    onError(error.localizedDescription)
                    return
                }
                
             
                fileName.downloadURL{ (url, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        onError(error.localizedDescription)
                        return
                    }
                    
                    if let metaDataUrl = url?.absoluteString {
                        FirestoreService.addNewPost(caption: caption, imageUrl: metaDataUrl)
                        onSuccess()
                        return
                        
                    }
                }
            }
        }
        else {
            onError("Could not decode the image")
            return
        }
        
    }
    
}
