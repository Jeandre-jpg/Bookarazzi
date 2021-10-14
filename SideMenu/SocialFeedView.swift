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
        NavigationView{
        ZStack {
            
            Color.ui.beige.edgesIgnoringSafeArea(
                       .all)
                   VStack(alignment: .leading) {
                       
                       
                 

                Text("Social Feed Screen")
                    .font(.custom("Robot-Condensed", size: 30))
                    .foregroundColor(Color.ui.black)
                    .frame(maxWidth: .infinity)
                Spacer()
                 
                NavigationView{
                   ScrollView{
                       
                       if viewModel.posts.count < 1 {
                           ProgressView()
                               .progressViewStyle(CircularProgressViewStyle(tint: Color.ui.orange))
                       }else{
                           ForEach(viewModel.posts) {post in
                               PostView(post: post)
                       }
            
                       }
                       
                    }
                   .navigationBarItems(leading: Text("Discover"), trailing: NavigationLink(
                    destination: NewPostView(),
                    label: {
                        Image(systemName: "plus.square.fill.on.square.fill")
                    }))
            }
                .background(Color.ui.beige)
                .onAppear(perform: {
                    viewModel.fetchAllPost()
                })
               
                }
                  
            }
//        .toolbar {
//             ToolbarItem(placement: .navigationBarTrailing) {
//                 Menu(content: {
//                     Text("Menu Item 1")
//                     Text("Menu Item 2")
//                      Text("Menu Item 3")
//                 }, label: {Text("button")})
//              }
//          }
       
        .animation(.easeOut)
    }
}
}


struct SocialFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SocialFeedView()
    }
}

