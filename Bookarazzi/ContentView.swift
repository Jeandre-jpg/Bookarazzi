//
//  ContentView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/16.
//



import SwiftUI

extension Color {
    static let ui = Color.UI()
    
    struct UI {
        let beige = Color("BeigeAccent")
        let yellow = Color("YellowAccent")
        let black = Color("BlackAccent")
        let grey = Color("GreyAccent")
        let orange = Color("OrangeAccent")
        let white = Color("WhiteAccent")
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.ui.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.ui.orange, Color.ui.yellow]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            List(0 ..< 20) {_ in
                Text("Book")
            }
            .navigationTitle("Bookarazzi")
        }
        .background(Color.ui.beige)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

