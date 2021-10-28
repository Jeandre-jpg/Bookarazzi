//
//  ContentView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/16.
//



import SwiftUI

extension Color {
    static let ui = Color.UI()
    
    struct UI {
        let beige = Color("BeigeAccent")
        let yellow = Color("YellowAccent")
        let black = Color("BlackAccent")
        let grey = Color("GreyAccent")
        let orange = Color("OrangeAccent")
        let white = Color("WhiteAccent")
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.ui.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.ui.orange, Color.ui.yellow]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}


struct ContentView: View {
    @State var optionSelected = 0
    
    var body: some View {
        VStack {
            if self.optionSelected == 0 {
                SocialFeedView()
            } else {
                ProfileView(user: User(userName: "", email: "", posts: [], followers: 0, following: 0, bio: "", imageUrl: ""))
            }
            Spacer()
            TabBarView(optionSelected: self.$optionSelected)
            
        }.background(Color.ui.beige).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

