//
//  OnboardingCardView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI
struct OnboardingCardView: View {
    
    var image: String
    var title: String
    var description: String
    
    
    var body: some View {
      
        VStack(alignment: .center, spacing: 1){
        
            
           Image("book-stack")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .padding()
               
            
            Text(title)
                .foregroundColor(Color.ui.orange)
                .font(.custom("Roboto-Black", size: 25))
                .multilineTextAlignment(.center)
                .frame(width: 250, height: 150, alignment: .center)
              
            
            
            Text(description)
                .foregroundColor(Color.ui.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .frame(width: 250, height: 50, alignment: .center)
                .padding()
              
                
                ButtonView()
                    .padding(.vertical, 20)
                  
            
           
             
        }
        .background(Color.ui.beige
        .edgesIgnoringSafeArea(.all))
        .cornerRadius(20.0)
    
       
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCardView(image: "book-stack", title: "Read to learn, Learn to grow", description: "See more of books through social media!").previewLayout(.fixed(width: 320, height: 640))
    }
}

