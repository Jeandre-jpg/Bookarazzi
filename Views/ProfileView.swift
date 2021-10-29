//
//  ProfileView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingMenu = false
    
//    @ObservedObject var viewModel = FirestoreService()
//    @State var userId = UserDefaults.standard.value(forKey: "user") as? String ?? ""
    
    @State var pickedImage: UIImage?
    @State var displayImage: Image?
    @State var user: User

    
    @AppStorage("userId") var userId: String = ""
    
    @State var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
        
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        pickedImage = inputImage
        displayImage = Image(uiImage: inputImage)
    }
    
    @State var showingActionSheet = false
    
    var body: some View {
        
        ZStack {
            
            BackgroundImage3()
                .edgesIgnoringSafeArea(
                .all)
            VStack(alignment: .leading, spacing: 10) {
          
                Text("Profile Screen")
                    .font(.custom("Roboto-Condensed", size: 30))
                    .foregroundColor(Color.ui.black)
                    .frame(maxWidth: .infinity)
                   
            
            ScrollView {
                    Spacer()
                            VStack(alignment: .center) {
                                VStack{
                                   Image("user_2")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: .infinity, height: 200, alignment: .trailing)
                            }
                                
                        VStack(alignment: .center) {
                   
                            Text(user.userName)
                                .font(.custom("Roboto-Black", size: 30))
                                .lineLimit(nil)
                                .padding(.top, 10)
                            Text("I joined • 16 September 2021")
                                .font(.custom("Montserrat-Thin", size: 10))
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                            
                            Text(user.email)
                                .font(.custom("Roboto-Black", size: 30))
                                .lineLimit(nil)
                                .padding(.top, 10)

                            
                            Divider()
                            
                            HStack{
                                VStack(alignment: .center, spacing: 30) {
                            Text("17")
                                .font(.custom("Roboto-Black", size: 30))
                                .lineLimit(nil)
                                .padding(.top, 10)
                                    
                                    Text("Posts Made")
                                        .font(.custom("Montserrat-Thin", size: 10))
                                        .foregroundColor(.gray)
                                        .padding(.top, 10)
                                }.padding(20)
                                
                                Divider()
                                
                                VStack(alignment: .center, spacing: 30) {
                                Text("73")
                                    .font(.custom("Roboto-Black", size: 30))
                                    .lineLimit(nil)
                                    .padding(.top, 10)
                                    
                                    Text("Posts Liked")
                                        .font(.custom("Montserrat-Thin", size: 10))
                                        .foregroundColor(.gray)
                                        .padding(.top, 10)
                                }.padding(20)
                                
                                Divider()
                                
                                VStack(alignment: .center, spacing: 30) {
                                Text("19")
                                    .font(.custom("Roboto-Black", size: 30))
                                    .lineLimit(nil)
                                    .padding(.top, 10)
                                    
                                    Text("Posts Saved")
                                        .font(.custom("Montserrat-Thin", size: 10))
                                        .foregroundColor(.gray)
                                        .padding(.top, 10)
                                }.padding(20)
                                
                              
                            }
                            Divider()
                            
                            
                            
                            VStack(alignment: .center, spacing: 20) {
                                                  HStack {
                                                   
                                                       Button(action: {
                                                           print("Book 1 Button Click")
                                                       }, label: {
                                                               cell1(image: Image("book_1"))
                                                            })
                                                       
                                                       Button(action: {
                                                           print("Book 2 Button Click")
                                                       }, label: {
                                                               cell2(image: Image("book_2"))
                                                            })
                                                          
                                                       }
                                                              
                                                           
                                                       
                        
                                                  HStack {
                                                   
                                                      Button(action: {
                                                          print("Book 3 Button Click")
                                                      }, label: {
                                                              cell3(image: Image("book_3"))
                                                           })
                                                   
                                                      Button(action: {
                                                          print("Book 4 Button Click")
                                                      }, label: {
                                                              cell4(image: Image("book_4"))
                                                           })
                                           
                                           Button(action: {
                                               print("Book 5 Button Click")
                                           }, label: {
                                                   cell5(image: Image("book_5"))
                                                })
                                        
                                              }.frame(width: 350, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .edgesIgnoringSafeArea(.all)
                                      
                                           
                           }
                            
//                            NavigationView{
//                               ScrollView(showsIndicators: false){
//
//                                   if viewModel.posts.count < 1 {
//                                       ProgressView()
//                                           .progressViewStyle(CircularProgressViewStyle(tint: Color.ui.orange))
//                                   }else{
//                                       ForEach(viewModel.posts) {post in
//                                           PostView(post: post)
//                                   }
//
//                                   }
//
//                                }
//
//                               .navigationBarItems(leading: Text("Feed"), trailing: NavigationLink(
//                                destination: NewPostView(),
//                                label: {
//                                    Image(systemName: "plus.square.fill.on.square.fill")
//
//                                        .renderingMode(.original)
//                                        .frame(width: 40, height: 40, alignment: .center)
//                                }))
//
//                        }.background( Color.ui.beige.edgesIgnoringSafeArea(
//                            .all))
//                            .accentColor(Color.ui.orange)
//                            .font(.custom("Montserrat-Thin", size: 25))
//                            .onAppear(perform: {
//                                viewModel.fetchPosts()
//                            })
                                   
                                
                                      }
                       
            }

            }
           
        
      
        }
            
            
            .padding(.leading, -50)
        .animation(.easeOut)
        .onAppear(perform: {
            FirestoreService.fetchUser(uid: userId, onSuccess: {user in
                self.user = user
            })
        })
        
       
    }
}
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(userName: "", email: "", posts: [], followers: 0, following: 0, bio: "", imageUrl: ""))
    }
}

func cell(image: Image) -> some View {
    HStack {
        VStack(alignment: .leading, spacing: 20) {

            Image("logo")
                 
        }
       
    }
}

func cell1(image: Image) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Image("book_1")
                .resizable()
                .frame(width: 175, height: 175)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
     
    }
  

}


func cell2(image: Image) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Image("book_2")
                .resizable()
                .frame(width: 175, height: 175)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
           
        }
     
    }

}


func cell3(image: Image) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Image("book_3")
                .resizable()
                .frame(width: 115, height: 115)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
      
    }
}


func cell4(image: Image) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Image("book_4")
                .resizable()
                .frame(width: 115, height: 115)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
          
        }
       
    }
}
func cell5(image: Image) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Image("book_5")
                .resizable()
                .frame(width: 115, height: 115)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
          
        }
      
    }

}

struct BackgroundImage3 : View {
    
    var body: some View {
        Image("Wallpaper3")
            .resizable()
            .frame(width: .infinity, height: .infinity)
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}
