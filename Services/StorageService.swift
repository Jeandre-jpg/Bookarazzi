//
//  StorageService.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/30.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseStorage

class StorageService {
    
    static var storage = Storage.storage()
    
    static var storageRoot = storage.reference()
    
    static var storagePost = storageRoot.child("post")
    
    static func savePost(caption: String, image: UIImage, onSuccess: @escaping()->Void, onError:@escaping(_ errorMessage:
                                                                                                            String)->Void){
        let fileName = storagePost.child(Date().description)
        if let imageData = image.jpegData(compressionQuality: 1) {
            
            storagePost.child(fileName).putData(imageData, metadata: nil){
                (_, error) in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    onError(error.localizedDescription)
                    return
                }
                
                storagePost.child(fileName).downloadURL{(url, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        onError(error.localizedDescription)
                        return
                }
                    
                    if let url = url {
                        print("Image \(url)")
                        onSuccess()
                        return
                    }
                
                }
                
                } else {
                    onError("Could not decode the image")
                    return
            }
            }
            
            
           
        
    
    }
    
}
