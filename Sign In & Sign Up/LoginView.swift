//
//  LoginView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//
//
import SwiftUI

struct LoginView: View {
    @State var isLoading = true
       @State var signInEmailVal = "email"
       @State var signInPasswordVal = "password"
   
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
   
       func signUp(){
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

        Text("Welcome Back")
            .font(.custom("Roboto-Condensed", size: 48))
            .bold()
            .multilineTextAlignment(.leading)
            .padding()

            Text("Welcome Back")
                .font(.subheadline)
                .padding()
                  
                  HStack(spacing: 20) {
                      Image(systemName: "person")
                      TextField(signInEmailVal, text: .constant("Email")).font(.custom("Montserrat-Light", size: 20))
                          .foregroundColor(Color.ui.black)
                               }
                  .padding(20)
                  .foregroundColor(Color.ui.white)
                  .background(Color.ui.white)

         


                  HStack(spacing: 20) {
                      Image(systemName: "lock.circle")
                      TextField(signInPasswordVal, text: .constant("Password")).font(.custom("Montserrat-Light", size: 20))
                          .foregroundColor(Color.ui.black)
                               }
                  .padding(20)
                  .foregroundColor(Color.ui.white)
                  .background(Color.ui.white)

                 
                  
            Button(action: {
                   print("Sign In")
               }, label: {
                   Text("Sign In")
                    .bold()
                    .font(.custom("Roboto-Black", size: 30))
                    .font(.title2)
                    .frame(width: 100, height: 25, alignment: .leading)
                       .padding(20)
                       .foregroundColor(Color.ui.orange)
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
