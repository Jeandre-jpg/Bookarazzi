//
//  TabBarView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/28.
//


import SwiftUI

struct TabBarPreviewView: View {
        
    var body: some View {
        
        VStack {
            Spacer()
            TabBarView(optionSelected:  .constant(0))
        }.background(Color.ui.white).edgesIgnoringSafeArea(.top)
    }
}

struct TabBarView : View  {
    @Binding var optionSelected : Int

    var body : some View {
        ZStack(alignment: .top) {
            HorizontalView(optionSelected: self.$optionSelected)
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedButton())
            Button(action: {
                
            }) {
                Image("Icon").renderingMode(.original)
                    .padding(18)
            }.background(Color.ui.beige)
            .clipShape(Circle())
            .offset(y: -32)
            .shadow(radius: 5)
        }.background(Color.ui.beige).edgesIgnoringSafeArea(.all)
    }
}

struct HorizontalView : View {
    
    @Binding var optionSelected : Int
    
    var body : some View {
        VStack {
            HStack {
                Button(action: {
                    self.optionSelected = 0
                }) {
                    Image(systemName: "house")
                }.foregroundColor(self.optionSelected == 0 ? .orange : .orange)
                
                Spacer(minLength: 24)
                
                Button(action: {
                    
                    self.optionSelected = 1
                    
                }) {
                    
                    Image(systemName: "person")
                    
                }.foregroundColor(self.optionSelected == 1 ? .orange : .orange)
            }
        }
    }
}

struct CurvedButton : View {
    
    var body : some View {
        
        Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
                        
            path.addLine(to: CGPoint(x: 0, y: 55))
            
        }.fill(Color.ui.beige)
            .edgesIgnoringSafeArea(.all)
        .rotationEffect(.init(degrees: 180))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPreviewView()
    }
}
