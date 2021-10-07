//
//  SignUpView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI


struct SignUpView: View {
    @State var isLoading = true
    @State var signUpEmailVal = "email"
    @State var signUpPasswordVal = "password"
    @State var signUpUserVal = "username"
    
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle = "Oh No!"
    
    @AppStorage("userId") var userId: String = ""
    
    
    func errorCheck() -> String? {
        if signUpUserVal.trimmingCharacters(in: .whitespaces).isEmpty || signUpEmailVal.trimmingCharacters(in: .whitespaces).isEmpty || signUpPasswordVal.trimmingCharacters(in: .whitespaces).isEmpty {
            return "Please fill in all the above information"
        }
        return nil
    }
    
    func clear(){
        self.signUpUserVal = ""
        self.signUpEmailVal = ""
        self.signUpPasswordVal = ""
    }
    
    func signUp(){
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        AuthService.signUp(username: signUpUserVal, email: signUpEmailVal, password: signUpPasswordVal, onSuccess: {(user) in
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
    
    
    var body: some View {
        ZStack{
            Color.ui.beige
                .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 40){
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

  Text("Sign Up")
      .font(.custom("Roboto-Condensed", size: 48))
      .bold()
      .multilineTextAlignment(.leading)
      .padding()

      Text("Welcome Back")
          .font(.subheadline)
          .padding()

            HStack(spacing: 20) {
                Image(systemName: "person")
                TextField(signUpUserVal, text: .constant("Username")).font(.custom("Montserrat-Light", size: 20))
                    .foregroundColor(Color.ui.black)
                           }
      
            .padding(20)
            .foregroundColor(Color.ui.black)
            .background(Color.ui.white)
            .font(.custom("Montserrat-Light", size: 20))


            HStack(spacing: 20) {
                Image(systemName: "envelope")
                TextField(signUpEmailVal, text: .constant("Email")).font(.custom("Montserrat-Light", size: 20))
                    .foregroundColor(Color.ui.black)
                            }
            .padding(20)
            .foregroundColor(Color.ui.black)
            .background(Color.ui.white)
            
            HStack(spacing: 20) {
                Image(systemName: "lock")
                TextField(signUpPasswordVal, text: .constant("Password")).font(.custom("Montserrat-Light", size: 20))
                    .foregroundColor(Color.ui.black)
                         }
            .padding(20)
            .foregroundColor(Color.ui.black)
            .background(Color.ui.white)


            Button(action: {print("clicked sign up button")
                               signUp()
                              }, label: {
                                  Text("Sign Up")
                                   .bold()
                                   .font(.custom("Roboto-Black", size: 30))
                                   .font(.title2)
                                   .frame(width: 150, height: 25, alignment: .leading)
                                      .padding()
                                       .foregroundColor(Color.ui.white)
                              }).buttonStyle(GradientButtonStyle())
                           .alert(isPresented: $showingAlert, content: {
                               Alert(title: Text(alertTitle), message: Text(error),
                                     dismissButton: .default(Text("Try Again")))
                           })

                    }
                    .padding()
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

