//
//  LogoView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI

struct LogoView: View {
    
    @State var isActive:Bool = false
    var body: some View {
        ZStack{
            Color.ui.beige
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 30){
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300, alignment: .center)
                    .accessibility(hidden: true)
                
                
                Text("App Version: 0. 01. 01")
                    .font(Font.custom("Montserrat-Light", size: 20))
                    .lineLimit(20)
                    .lineSpacing(20)
                    .foregroundColor(Color.ui.black)
                    
                
                Text("Developed by: Jeandré De Villiers")
                    .font(Font.custom("Montserrat-Light", size: 10))
                    .lineLimit(20)
                    .lineSpacing(20)
                    .foregroundColor(Color.ui.black)
                
                    
                
              
            }
        }.onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
              
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
