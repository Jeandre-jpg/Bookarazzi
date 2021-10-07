//
//  UserView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI

struct UserView: View {
    @State private var showingMenu = false
    var body: some View {
        ZStack {
            
            Color.ui.yellow.edgesIgnoringSafeArea(
                .all)
            VStack(alignment: .leading) {
                Button(action: {self.showingMenu.toggle()}) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.black)
                }
                .frame(width: 50.0, height: 50.0)
                Spacer()
                Text("User view")
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

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
