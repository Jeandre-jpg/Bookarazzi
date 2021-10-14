//
//  AuthScreenView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/07.
//

import SwiftUI

struct AuthScreenView: View {
    
    @State var showSignUp = false
    
   
    
    var body: some View {
        ZStack{
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            Color.ui.beige
                .clipShape(CShape())
            
            Path {path in
                path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 130, y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180),
                            clockwise: true)
            }
            .fill(Color.ui.beige)
            
            Button(action: {
                withAnimation(.easeOut){
                    self.showSignUp = false
                }
            }, label: {
                Image(systemName: showSignUp ? "person.badge.plus.fill" : "xmark")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color.ui.black)
            }).offset(x: -37, y: -30)
            
            Button(action: {
                withAnimation(.easeIn){
                    showSignUp = true
                }
            }, label: {
                Image(systemName: showSignUp ? "xmark" : "person.badge.plus.fill")
                 .font(.system(size: 25, weight: .bold))
                 .foregroundColor(Color.ui.black)
            }).offset(x: -115, y: -40)
        }
        .offset(y: showSignUp ? -UIScreen.main.bounds.height + 130 : 0)
            
            showSignUp ? nil: LoginView()
            showSignUp ? SignUpView() : nil
        
}.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .statusBar(hidden: true)
        .background(Color.ui.beige
        .edgesIgnoringSafeArea(.all))
                        
    }
}

struct AuthScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreenView()
    }
}


struct CShape: Shape {
    func path(in rect:CGRect) -> Path {
        return Path {path in
            
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
                        path.addLine(to: CGPoint(x: rect.width, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: rect.height - 50))
                       
                        
            path.addArc(center: CGPoint(x: rect.width - 50, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
    }
}
}
