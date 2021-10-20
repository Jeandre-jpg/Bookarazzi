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
                   VStack(alignment: .center) {
                       
                       
                 

                Text("Social Feed")
                    .font(.custom("Roboto-Condensed", size: 30))
                    .padding(.top, -50)
                    .foregroundColor(Color.ui.black)
                    .frame(width: 300, height: 25, alignment: .center)
             
                 
                NavigationView{
                   ScrollView(showsIndicators: false){
                       
                       if viewModel.posts.count < 1 {
                           ProgressView()
                               .progressViewStyle(CircularProgressViewStyle(tint: Color.ui.orange))
                       }else{
                           ForEach(viewModel.posts) {post in
                               PostView(post: post)
                       }
            
                       }
                       
                    }
                   .navigationBarItems(leading: Text("Feed"), trailing: NavigationLink(
                    destination: NewPostView(),
                    label: {
                        Image(systemName: "plus.square.fill.on.square.fill")
                           
                            .renderingMode(.original)
                            .frame(width: 40, height: 40, alignment: .center)
                    }))
            }.background( Color.ui.beige.edgesIgnoringSafeArea(
                .all))
                .accentColor(Color.ui.orange)
                .font(.custom("Montserrat-Thin", size: 25))
                .onAppear(perform: {
                    viewModel.fetchAllPost()
                })
               
                }
                  
            }

       
        .animation(.easeOut)
    }
}
}


struct SocialFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SocialFeedView()
    }
}

