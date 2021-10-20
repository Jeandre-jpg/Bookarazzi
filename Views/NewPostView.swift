//
//  NewPostView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI

struct NewPostView: View {
    @State var caption: String = "Your caption here..."
    @State var pickedImage: UIImage?
    @State var displayImage: Image?
    
    
    @State private var errorMessage: String = ""
    @State private var showingAlert = false
    @State private var errorTitle = "Oh No!"
    
    
    
    
    @State var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        pickedImage =  inputImage
        displayImage = Image(uiImage: inputImage)
    }
    
    @State var showingActionSheet = false
    
    func errorCheck() -> String? {
        if  caption.trimmingCharacters(in: .whitespaces).isEmpty || pickedImage == nil {
            return "Please upload an image with caption"
        }
        return nil
    }
    
    func clear(){
        self.displayImage = nil
        self.caption = ""
        
    }
    

    func uploadImage(){
        if let error = errorCheck() {
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        
        StorageService.savePost(caption: self.caption, image: self.pickedImage!, onSuccess: {
            self.clear()
        }) {
            (errorMessage) in
            self.errorMessage = errorMessage
            self.showingAlert = true
            return
        }
    }
        
    
    @State private var showingMenu = false
    var body: some View {
        ZStack {
            
            Color.ui.orange.edgesIgnoringSafeArea(
                .all)
            VStack(alignment: .center, spacing: 40) {
                       
                            Text("Create a Post")
                                .font(.custom("Roboto-Condensed", size: 30))
                         
                            
                            if displayImage != nil {
                                displayImage!.resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 150, alignment: .center)
                                    .background(Color.ui.white)
                                    .onTapGesture (perform: {
                                        self.showingImagePicker = true
                                    })
                
                            }else{
                
                            Image("bookshelf")
                                .resizable()
                                .scaledToFit()
                                .saturation(0.1)
                                .frame(width: 200, height: 150, alignment: .center)
                                .padding(30)
                               
                                .background(Color.ui.white)
                                .onTapGesture (perform: {
                                    self.showingImagePicker = true
                                })
                                .cornerRadius(20.0)
                            }
                
                            TextEditor(text: caption == "" ? .constant("Placeholder"): $caption)
                                .padding()
                                .frame(height: 200)
                              
                
                
                            Button(action: {
                                uploadImage()
                                   print("clicked create post button")
                               }, label: {
                                   Text("Create Post")
                                    .font(.custom("Roboto-Condensed", size: 30))
                                    .frame(width: 320, height: 25, alignment: .center)
                                       .padding(20)
                                       .foregroundColor(Color.ui.black)
                               })
                                .background(Color.ui.yellow)
                               .foregroundColor(Color.white)
                               .cornerRadius(15)
                               .alert(isPresented: $showingAlert, content: {
                                   Alert(title: Text(errorTitle), message: Text(errorMessage),
                                         dismissButton: .default(Text("Try Again")))
                                })
                               .cornerRadius(20.0)
                        }
            .cornerRadius(20.0)
            .padding(20)
            .cornerRadius(20.0)
            .background(Color.ui.orange)
            
                    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
                        ImagePicker(pickedImage: $pickedImage)
                    }.actionSheet(isPresented: $showingActionSheet){
                        ActionSheet(title: Text(""), buttons: [
                            .default(Text("Upload an Image")){
                                self.showingImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Take a Picture")){
                            self.showingImagePicker = true
                            self.sourceType = .camera
                            },
                            .cancel()
                        ])
                    
                            }.padding(.horizontal) .frame(maxWidth: .infinity)
                        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
            .animation(.easeOut)
                
                          

                    }
               
                }
                
        
       
    
    

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}

