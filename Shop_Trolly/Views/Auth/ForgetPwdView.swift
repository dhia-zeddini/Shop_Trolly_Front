//
//  ForgetPwdView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct ForgetPwdView: View {
    @Binding var email: String
    @State private var isOn = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text("FORGET PASSWORD")
                    .foregroundColor(Color.themePrimary)
                .bold()
                Spacer()
                Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                         }
                       .padding(.leading, 16)
                       .foregroundColor(.black)
            }
            .padding(.top,20)
            .padding(.horizontal, 40)
            HStack {
                Spacer()
                Text("Forgot your Password")
                    .foregroundColor(Color(hex: "#152354"))
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 40)
            
            HStack {
                Text("Enter email address we'll send you an email")
                Spacer()
            }
            .padding(.horizontal, 40)
            .foregroundColor(.secondary)
            .padding(.bottom,20)
            
            HStack {
                Text("Email")
                Spacer()
            }.padding(.horizontal, 40)
                .foregroundColor(.secondary)
                .bold()
            CustomTF(hint: "Enter your email ", value: $email).padding(.horizontal, 40)
     
       
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                Text("Send email")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.themeSecondary)
            .padding(.horizontal, 40)
            .padding(.top,20)
            .padding(.bottom,50)
            
        }
        .frame(height: 600)
        //.padding(.top, 20)
       // .interactiveDismissDisabled()
    }
  
}

#Preview {
    ContentView()
}
