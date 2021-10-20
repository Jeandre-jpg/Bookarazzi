//
//  OnboardingView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            OnboardingCardView(image: "book-stack", title: "Read to learn, Learn to grow", description: "See more of books through social media!")
            
            OnboardingCardView(image: "bookshelf", title: "Get the right book for you", description: "View all of your friends posts.")
            
            OnboardingCardView(image: "notebook", title: "Books that inspire you!", description: "Click below to start.")
        }
       
        .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .cornerRadius(30)
        
       
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
