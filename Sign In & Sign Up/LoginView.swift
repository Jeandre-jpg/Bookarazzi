//
//  LoginView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI

struct LoginView: View {
    @State var isLoading = true
    @State var email = "email"
    @State var password = "password"
    @State private var isActive: Bool = false
    
          var body: some View {
              ZStack{
                  Color.ui.beige
                      .ignoresSafeArea()
                      .frame(minWidth: <#T##CGFloat?#>, idealWidth: <#T##CGFloat?#>, maxWidth: <#T##CGFloat?#>, minHeight: <#T##CGFloat?#>, idealHeight: <#T##CGFloat?#>, maxHeight: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
              VStack(alignment: .leading, spacing: 10){
                  HStack( spacing: 20){
                  Button(action: {
                      print("Button action")
                  }) {
                      HStack {
                          Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                      }.padding(10)
                          .foregroundColor(Color.ui.black)
                          
                  }
                  }.background(Color.ui.beige, alignment: .leading)
  
        Text("Welcome Back")
            .font(.custom("Roboto-Condensed", size: 48))
            .bold()
            .multilineTextAlignment(.leading)
            .padding()
            
            Text("Welcome Back")
                .font(.subheadline)
                .padding()
            
            HStack(spacing:10) {
                TextField(email, text: .constant("Email")).foregroundColor(Color.gray)
                    .font(.custom("Montserrat-Light", size: 20))
            }
            .padding(20)
           
            
            HStack(spacing:20) {
                TextField(password, text: .constant("Password")).foregroundColor(Color.gray)
                    .font(.custom("Montserrat-Light", size: 25))
            }
            .padding(20)
        
            
            
            Button(action: {
                   print("Sign In")
               }, label: {
                   Text("Sign In")
                    .bold()
                    .font(.custom("Roboto-Black", size: 30))
                    .font(.title2)
                    .frame(width: 30, height: 25, alignment: .leading)
                       .padding(70)
                        .foregroundColor(Color.ui.black)
               })
            
        }
         .multilineTextAlignment(.leading)
        .opacity(isLoading ? 0 : 1)
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/.delay(0.8))
        .onAppear(perform: {
                    isLoading = false
            
        }) .background(Color.ui.beige)
            .edgesIgnoringSafeArea(.all)
           
    
          
              }
       
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

