//
//  SocialFeedView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/28.
//

import SwiftUI

struct SocialFeedView: View {
    
    @ObservedObject var viewModel = FirestoreService()
    @State private var showingMenu = false
    var body: some View {
        ZStack {
            
            Color.ui.beige.edgesIgnoringSafeArea(
                .all)
            VStack(alignment: .leading) {
                Button(action: {self.showingMenu.toggle()}) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.black)
                }

                Spacer()
                Text("Social Feed Screen")
                    .font(
                        .largeTitle)
                    .foregroundColor(
                        .black)
                    .frame(maxWidth: .infinity)
                Spacer()
                
              
                Spacer()
               
                NavigationView{
                   ScrollView{
                       
                       if viewModel.posts.count < 1 {
                           ProgressView()
                               .progressViewStyle(CircularProgressViewStyle(tint: Color.red))
                       }else{
                           ForEach(viewModel.posts) {post in
                               PostView(post: post)
                       }
            
                       }
                       
                    }.navigationBarItems(leading: Text("Discover"), trailing: NavigationLink(
                    destination: NewPostView(),
                    label: {
                        Image(systemName: "plus.square.fill.on.square.fill")
                    }))
            }
                .onAppear(perform: {
                    viewModel.fetchAllPost()
                })
                }
            }
        .offset(x: showingMenu ? 200.0 : 0.0, y: 0)
        .animation(.easeOut)
    }
}

struct SocialFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SocialFeedView()
    }
}
