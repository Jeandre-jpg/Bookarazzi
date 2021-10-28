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
//        Button(action: {
//            print("Exit Onboarding")
//            isOnboarding = false
            NavigationLink(destination: LoginView()){
                Text(" Skip ")
                    .font(.custom("Montserrat_Thin", size: 20))
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
                    .font(.custom("Montserrat-Thin", size: 20))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                
                  
                    .foregroundColor(Color.ui.black)
                    .multilineTextAlignment(.leading)

    }
            .background(Color.ui.orange)
            .foregroundColor(Color.ui.black)
            .cornerRadius(20.0)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
}
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
    }
}
