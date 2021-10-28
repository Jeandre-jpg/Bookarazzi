//
//  ProfileView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingMenu = false
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
                                    Image("user_1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 350, height: 350, alignment: .center)
                                    .accessibility(hidden: true)
                                    .cornerRadius(20.0)
                                  
                                }
                            }
                        VStack(alignment: .center) {
                   
                            Text("JohnTheBoss")
                                .font(.custom("Roboto-Black", size: 30))
                                .lineLimit(nil)
                                .padding(.top, 10)
                            Text("I joined • 16 September 2021")
                                .font(.custom("AvenirNext-Regular", size: 15))
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                            
                            Divider()
                            
                            HStack{
                                VStack(alignment: .center, spacing: 30) {
                            Text("17")
                                .font(.custom("Roboto-Black", size: 30))
                                .lineLimit(nil)
                                .padding(.top, 10)
                                    
                                    Text("Posts Made")
                                        .font(.custom("AvenirNext-Regular", size: 10))
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
                                        .font(.custom("AvenirNext-Regular", size: 10))
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
                                        .font(.custom("AvenirNext-Regular", size: 10))
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
                                   
                                
                                      }
                       
            }
            }
           
        
      
        }
       
        .animation(.easeOut)
       
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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
