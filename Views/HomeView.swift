//
//  HomeView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
            
            SocialFeedView()
                .tabItem({
                    Image(systemName: "house.fill")
                    
                })
            
            NewPostView()
                .tabItem({
                    Image(systemName: "plus.rectangle.fill")
                })
            
            ProfileView()
                .tabItem({
                    Image(systemName: "person.fill")
                })
            
        }
        .accentColor(Color.ui.orange)
        
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
