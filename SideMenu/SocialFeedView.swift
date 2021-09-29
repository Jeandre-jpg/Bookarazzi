//
//  SocialFeedView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/28.
//

import SwiftUI

struct SocialFeedView: View {
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
                Text("Chat")
                    .font(
                        .largeTitle)
                    .foregroundColor(
                        .black)
                    .frame(maxWidth: .infinity)
                Spacer()
            }.padding(.horizontal) .frame(maxWidth: .infinity)
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
