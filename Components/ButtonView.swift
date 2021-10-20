//
//  ButtonView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI

struct ButtonView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button(action: {
            print("Exit Onboarding")
            isOnboarding = false
            
        }, label: {
            HStack(spacing: 20){
                Text("Skip")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(Capsule().strokeBorder(Color.ui.black, lineWidth: 1.35))
                    .accentColor(.black)
        })
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
    }
}
