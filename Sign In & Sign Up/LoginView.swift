//
//  LoginView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//
//

import SwiftUI

struct LoginView: View {
    @State private var isLoading = true
    @State private var signInEmailVal:String = "Email"
    @State private var signInPasswordVal:String = "password"
    
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle = "Oh No!"
    
    @AppStorage("userId") var userId: String = ""
    
    func errorCheck() -> String? {
        if  signInEmailVal.trimmingCharacters(in: .whitespaces).isEmpty || signInPasswordVal.trimmingCharacters(in: .whitespaces).isEmpty {
            return "Please fill in all the above information"
        }
        return nil
    }
    
    func clear(){
        self.signInEmailVal = ""
        self.signInPasswordVal = ""
    }
    
    func signIn(){
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        AuthService.signIn(email: signInEmailVal, password: signInPasswordVal, onSuccess: {(user) in
            self.clear()
            userId = user
            return
        }, onError: {(errorMessage) in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        })
    }
    

    @State var logingAnimating = true
    
    var body: some View {
        VStack{
            
            VStack(alignment: .center, spacing: 40){
           
        Text("Login")
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.custom("Roboto-Condensed", size: 48))
            .multilineTextAlignment(.leading)
                
                Image("book (1)")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .center)
                    .accessibility(hidden: true)
            
            Text("Welcome Back")
                .font(.custom("Montserrat-Thin", size: 25))
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.leading)
        }
        .padding(.bottom, 30)
            
            HStack(spacing:20) {
                Image(systemName: "envelope")
                    .padding(.leading, 10)
                TextField("Email", text: $signInEmailVal)
                    .padding()
                    .font(.custom("Montserrat-Light", size: 20))
                    .autocapitalization(.none)
            }
            .padding(.top, 20)
            .background(Color.ui.white)
            .cornerRadius(10.0)
            
           
            
            HStack(spacing:20) {
                Image(systemName: "lock")
                    .padding(.leading, 10)
                SecureField("password", text: $signInPasswordVal)
                    .padding()
                    .font(.custom("Montserrat-Light", size: 20))
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .cornerRadius(10.0)
            .background(Color.ui.white)
            .padding(.top, 20)
            .padding(.bottom, 40)
            
            
            Button(action: {
                   print("clicked sign up button")
                signIn()
               }, label: {
                   Text("Login")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                       
               })
            .cornerRadius(10.0)
            .foregroundColor(Color.ui.black)
            .background(Color.ui.yellow)
            .cornerRadius(20.0)
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text(alertTitle), message: Text(error),
                      dismissButton: .default(Text("Try Again")))
                
            })
        
        NavigationLink(destination: SocialFeedView()){
                          Text("")
                          .font(.custom("Montserrat-Thin", size: 20))
                          .padding(.top, -50)
                          .foregroundColor(Color.ui.black)
                          .multilineTextAlignment(.leading)
                          .frame(width: 50, height: 10.0)
          
                    }
                
               
        }
        
        .background(Color.ui.beige)
        .ignoresSafeArea(.all)
        .padding()
        .opacity(isLoading ? 0 : 1)
        .animation(.easeIn.delay(0.8))
        .onAppear(perform: {
            isLoading = false
        })
        .edgesIgnoringSafeArea(.all)
    }
       
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
