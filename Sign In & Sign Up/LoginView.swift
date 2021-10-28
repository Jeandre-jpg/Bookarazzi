//
//  LoginView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//
//

import SwiftUI

struct LoginView: View {
    
    @AppStorage("userId") var userId: String = ""
    
    
    @State private var emailVal: String = ""
    @State private var passwordVal: String = ""
    
    @State var isLoading: Bool = true
    
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oh No!"
    
    func errorCheck() -> String? {
        if emailVal.trimmingCharacters(in: .whitespaces).isEmpty || passwordVal.trimmingCharacters(in: .whitespaces).isEmpty
            {
            return "Please fill in all required info"
        }
        return nil
    }
    
    func login() {
        if let error = errorCheck() {
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        
        AuthService.signIn(email: emailVal, password: passwordVal, onSuccess: {(uid) in
            print(uid)
            userId = uid
            return
        }, onError: {(error) in
            self.errorMessage = error
            self.showingAlert = true
            return
        })
        
    }
    
  
    
    var body: some View {
        
 
        
        NavigationView {
            ZStack {
                BackgroundImage()
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    
                    Text("Sign In")
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
                
                Text("Please login to your account")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("Lato", size: 15))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image(systemName: "envelope")
                            .padding(.leading, 10)
                        TextField("email", text: $emailVal)
                            .padding()
                            .font(.custom("Montserrat-Light", size: 20))
                            .disableAutocorrection(true)
                    }
                    .padding(.top, 20)
                    .background(Color.ui.white)
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                  
                    
                    
                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading, 10)
                        SecureField("password", text: $passwordVal)
                            .padding()
                            .font(.custom("Montserrat-Light", size: 20))
                            .disableAutocorrection(true)
                    }
                    .padding(.top, 20)
                    .background(Color.ui.white)
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        login()
                    }, label: {
                        Text("Sign In")
                            .font(.custom("Montserrat-Light", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                        .foregroundColor(Color.ui.black)
                    .background(Color.ui.yellow)
                    .frame(width: 250.0, height: 50.0, alignment: .center)
                    .cornerRadius(20.0)
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try Again")))
                    })
                    
                }
                
                Spacer()
                
                Text("Don't already have an account?")
                    .foregroundColor(.gray)
                    .font(.custom("Montserrat-Medium", size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                NavigationLink (
                    destination: SignUpView(),
                    label: {
                            Text("Register")
                            .foregroundColor(Color.ui.black)
                                .font(.custom("Montserrat-Medium", size: 15))
                        })
                
                Spacer()
                
            }
        }
            .background(Color.ui.beige)
            
        }
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

        .navigationBarHidden(true)
      
                .opacity(isLoading ? 0 : 1)
                .animation(.easeIn.delay(0.8))
                .onAppear(perform: {
                    isLoading = false
                })
     
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct BackgroundImage : View {
    
    var body: some View {
        Image("Wallpaper")
            .resizable()
            .frame(width: .infinity, height: .infinity)
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}
