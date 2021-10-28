//
//  HomeView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/28.
//


import SwiftUI


struct HomeView: View {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
