//
//  SplashView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/29.
//

import SwiftUI

struct SplashView: View {
    @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 10

    var body: some View {
        
        ZStack{
            Color.ui.beige
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 50){
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .accessibility(hidden: true)
                    
                
                Text("DISCOVER\nYOUR\nBOOKARAZZI\nFANTASY")
                    .font(.custom("Roboto-Black", size: 48))
                    .multilineTextAlignment(.leading)
                    .lineLimit(20)
                    .lineSpacing(20)
                    .padding()
                    .foregroundColor(Color.ui.black)
                
                
                
                NavigationLink(destination: LoginView()){
                        Text("Start")
                        .font(.title)
                        .padding(20)
                        .foregroundColor(Color.ui.black)
                        .multilineTextAlignment(.leading)
                        .frame(width: 150, height: 50.0)
                        .background(Color.ui.beige)
                        .border(Color.ui.grey, width: 2, cornerRadius:25)
                      }
                
                NavigationLink(destination: SignUpView()){
                        Text("Don't already have an Accoun? Sign Up")
                        .font(.body)
                        .padding()
                        .foregroundColor(Color.ui.black)
                        .multilineTextAlignment(.leading)
                        .frame(width: 350, height: 50.0)
            
                      }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
}
