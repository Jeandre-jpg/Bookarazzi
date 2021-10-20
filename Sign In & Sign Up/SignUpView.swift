//
//  SignUpView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//


import SwiftUI


struct SignUpView: View {
    
    @State private var signUpEmailVal = "Email"
    @State private var signUpPasswordVal = "Password"
    @State private var signUpUserVal = "Username"
    
    @State var isLoading: Bool = true
    
    @State private var errorMessage: String = ""
    @State private var showingAlert = false
    @State private var alertTitle = "Oh No!"
    
    @AppStorage("userId") var userId: String = ""
    
    
    func errorCheck() -> String? {
        if signUpUserVal.trimmingCharacters(in: .whitespaces).isEmpty || signUpEmailVal.trimmingCharacters(in: .whitespaces).isEmpty || signUpPasswordVal.trimmingCharacters(in: .whitespaces).isEmpty {
            return "Please fill in all the above information"
        }
        return nil
    }
    
//    func clear(){
//        self.signUpUserVal = ""
//        self.signUpEmailVal = ""
//        self.signUpPasswordVal = ""
//    }
//
    func signUp(){
        if let error = errorCheck() {
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        
        AuthService.signUp(username: signUpUserVal, email: signUpEmailVal, password: signUpPasswordVal, onSuccess: {(uid) in
            print(uid)
//            self.clear()
//            userId = user
            return
        }, onError: {(error) in
//            print("Error \(errorMessage)")
            self.errorMessage = error
            self.showingAlert = true
            return
        })
    }
    
    @State var logingAnimating = true
    
    var body: some View {
        
        ZStack{
//            Color(redColour)
//                .ignoresSafeArea()
    VStack{
        VStack(alignment: .center, spacing: 40){
       
    Text("Sign Up")
        .frame(maxWidth: .infinity, alignment: .center)
        .font(.custom("Roboto-Condensed", size: 48))
        .multilineTextAlignment(.leading)
            
            Image("book (1)")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150, alignment: .center)
                .accessibility(hidden: true)
        
        Text("Get Your Profile Ready")
            .font(.custom("Montserrat-Thin", size: 25))
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.leading)
    }
        .padding()
            
            HStack {
                Image(systemName: "person")
                    .padding(.leading, 10)
                TextField("Username", text: $signUpUserVal)
                    .padding()
                    .font(.custom("Montserrat-Thin", size: 20))
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .cornerRadius(10.0)
            .background(Color.ui.white)
            .padding(.top, 20)
            
            HStack{
                Image(systemName: "envelope")
                    .padding(.leading, 10)
                TextField("Email", text: $signUpEmailVal)
                    .padding()
                    .font(.custom("Montserrat-Thin", size: 20))
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .padding(.top, 20)
            .cornerRadius(10.0)
            .background(Color.ui.white)
            
                HStack{
                Image(systemName: "lock")
                        .padding(.leading, 10)
                    SecureField("Password", text: $signUpPasswordVal)
                        .padding()
                        .font(.custom("Montserrat-Thin", size: 20))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
            }
                .padding(.top, 20)
                .cornerRadius(10.0)
                .background(Color.ui.white)
                .padding(.bottom, 40)
            
            
            
            Button(action: {
                   print("clicked sign up button")
                signUp()
               }, label: {
                   Text("Sign Up")
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
                Alert(title: Text(alertTitle), message: Text(errorMessage),
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
    .padding()
    .opacity(isLoading ? 0 : 1)
    .animation(.easeIn.delay(0.8))
    .onAppear(perform: {
        isLoading = false
    })
    .edgesIgnoringSafeArea(.all)
            
        }

        }
    }
    
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
