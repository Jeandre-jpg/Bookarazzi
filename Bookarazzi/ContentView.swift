//
//  ContentView.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/16.
//

import SwiftUI

class MenuContent: Identifiable, ObservableObject {
    var id = UUID()
    var name: String = ""
    var image: String = ""
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
        let beige = Color("BeigeAccent")
        let yellow = Color("BlueAccent")
        let black = Color("BlackAccent")
        let grey = Color("GreyAccent")
        let orange = Color("OrangeAccent")
        let white = Color("WhiteAccent")
    }
}


struct ContentView: View {
    var menu: [MenuContent] = menuContents
    @State var menuItemSelected: MenuContent = menuContents[0]
    var body: some View {
        ZStack {
            List(menu) { menuItem in
                MenuCell(menuItem: menuItem).onTapGesture {
                    self.menuItemSelected = menuItem
                }
            }
            self.selected(Menu: menuItemSelected)
        }
    }
    
    
    func selected(Menu: MenuContent) -> some View {
        switch Menu.name {
    
        case "Profile":
            return AnyView(ProfileView())
            
        case "Social Feed":
            return AnyView(SocialFeedView())
            
        case "New Post":
            return AnyView(NewPostView())
            
        case "User View":
            return AnyView(UserView())
            
        case "Logout":
            return AnyView(LoginView())
            
        default:
            return AnyView(SocialFeedView())
        }
    }
}





#if DEBUG
let menuHome = MenuContent(name: "Home", image: "house.fill")
let menuProfile = MenuContent(name: "Profile", image: "person.fill")
let menuChat = MenuContent(name: "Chat", image: "message.fill")
let menuContents = [menuHome, menuProfile, menuChat]

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(menu: menuContents)
    }
}
#endif

struct MenuCell: View {
    var menuItem: MenuContent = menuContents[0]
    var body: some View {
        HStack {
            Image(systemName: menuItem.image)
                .foregroundColor(.black)
            Text(menuItem.name).foregroundColor(.black)
        }
    }
}
