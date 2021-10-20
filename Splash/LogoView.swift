//
//  LogoView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI

struct LogoView: View {
    
    @State var isAnimating = false
    @State var logo = 1
    
    @State var isActive:Bool = false
    var body: some View {
        VStack{
            if self.isActive {
                SplashView()
            } else {
                
                                 ZStack {
                                     Color.ui.beige.edgesIgnoringSafeArea(
                                         .all)
                                     VStack(alignment: .center, spacing: 40){
                                       
                                         
                                         Image("\(logo)")
                                             .renderingMode(.template)
                                             .resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .frame(width: 300, height: 300, alignment: .center)
                                             .accessibility(hidden: true)
                                             
                                             .rotationEffect(Angle(degrees: isAnimating ? 1080 : 0))
                                             .animation(Animation
                                                         .easeOut(duration: 0.7)
                                                         .delay(isAnimating ? 0.5 : 0)
                                                         .repeatForever(autoreverses: false)
                                             )
                                             .scaleEffect(isAnimating ? 1 : 0)
                                             .animation(Animation
                                                         .easeInOut(duration: 0.7)
                                                         .delay(isAnimating ? 0.5 : 0)
                                                         .repeatForever(autoreverses: true)
                                             )
                                         
                                         Text("App Version: 2. 01. 02")
                                             .font(Font.custom("Montserrat-Light", size: 20))
                                             .lineLimit(20)
                                             .frame(width: 250, height: 50, alignment: .center)
                                             .lineSpacing(20)
                                             .foregroundColor(Color.ui.black)
                                             
                                         
                                         Text("Developed by: Jeandrè De Villiers")
                                             .font(Font.custom("Montserrat-Light", size: 15))
                                             .lineLimit(20)
                                             .frame(width: 250, height: 50, alignment: .center)
                                             .lineSpacing(20)
                                             .foregroundColor(Color.ui.black)
                                         
                                         
                                     }.frame(width: 150, height: 150)
                                         .onAppear(){
                                             Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) {_ in
                                                 self.logo = Int.random(in: 0...1)
                                             }
                                             self.isAnimating = true
                                         }.foregroundColor(Color.ui.black)
                                 
   
                       
                            }
                    .edgesIgnoringSafeArea(.vertical)
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                          
                            withAnimation {
                                self.isActive = true
                            }
                        }
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
