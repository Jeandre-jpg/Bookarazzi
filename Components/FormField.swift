//
//  FormField.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/10/28.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    var icon: String
    var placeholder: String
    var isSecure = false
    
    
    var body: some View {
        Group{
            HStack{
                Image(systemName: icon).padding()
                Group{
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    } else {
                        TextField(placeholder, text: $value)
                    }
                }
                .font(.custom("Montserrat-Thin", size: 20))
                .foregroundColor(Color.ui.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            }
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.ui.black, lineWidth: 4)).padding()
        }
    }
}

