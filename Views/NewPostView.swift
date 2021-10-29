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
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oh No!"
    
    @State var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
        
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        pickedImage = inputImage
        displayImage = Image(uiImage: inputImage)
    }
    
    @State var showingActionSheet = false
    
    func errorCheck() -> String? {
        if caption.trimmingCharacters(in: .whitespaces).isEmpty || pickedImage == nil
            {
            return "Please upload an image with a caption"
        }
        return nil
    }
    
    func clear() {
        self.displayImage = nil
        self.caption = ""
    }
    
    func uploadImage() {
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
    
    var body: some View {
        
        NavigationView {
            ZStack{
                BackgroundImage()
                    .edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("CREATE A NEW POST")
                    .foregroundColor(Color.ui.black)
                    .font(.custom("Roboto-Black", size: 30))
                    .padding(.bottom, 1)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                if displayImage != nil {
                    displayImage!.resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 150, alignment: .center)
                        .onTapGesture(perform: {
                            self.showingImagePicker = true
                        })
                }
                else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding(10)
                        .foregroundColor(Color.ui.orange)
                        .onTapGesture(perform: {
                            self.showingImagePicker = true
                        })
                }
                
                TextEditor(text: $caption)
                    .padding(20)
                    .frame(height: 200)
                    .background(Color.ui.beige)
                    .padding(10)
                    .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                        )
                
              
                
                Button(action: {
                    uploadImage()
                    print("Clicked post button")
                }, label: {
                    Text("POST")
                        .font(.custom("Roboto-Black", size: 30))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                })
                .foregroundColor(Color.ui.black)
                .background(Color.ui.yellow)
                .frame(width: 250.0, height: 50.0, alignment: .center)
                .cornerRadius(8)
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try Again")))
                })
                
            }
            .padding()
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
            }
            }
            .padding(.top, -150)
            
        }
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
