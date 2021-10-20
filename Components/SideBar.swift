//
//  SideBar.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/14.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
//        NavigationView {
            #if os(iOS)
            SideBarContent()
                .navigationTitle("Bookarazzi")
                .background(Color.ui.beige)
            #else
            SideBarContent()
                .frame(minWidth: 200, idealWidth: 250,maxWidth: 300)
                .background(Color.ui.beige)
            #endif
//        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}

struct SideBarContent: View {
    var body: some View {
        List {
            NavigationLink(destination: SocialFeedView()) {
                Label("Social Feed Screen", systemImage: "tray.full.fill")
                   }
            
            
            NavigationLink(destination: ProfileView()) {
                Label("Profile", systemImage: "person.fill")
                   }
            
           
            NavigationLink(destination: NewPostView()) {
                Label("New Post Screen", systemImage: "plus.circle.fill")
                   }
           
            
            NavigationLink(destination: UserView()) {
                Label("User View", systemImage: "person.crop.circle")
                   }
            
          
            NavigationLink(destination: LogoView()) {
                Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right.fill")
                   }
            
           
        }
        .listStyle(SidebarListStyle())
    }
}
