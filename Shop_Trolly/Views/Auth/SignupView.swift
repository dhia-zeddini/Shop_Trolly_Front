//
//  SignupView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct SignupView: View {
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        VStack{
          
            
            HStack {
                Text("Create an Account!")
                    .foregroundColor(Color(hex: "#152354"))
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 20)
            
            HStack {
                Text("Enter your informations to gcreate an account")
                Spacer()
            }
            .padding(.horizontal, 40)
            .foregroundColor(.secondary)
            
            ZStack {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Image(systemName: "applelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                    Text("  Continue with Apple")
                        .foregroundColor(Color(hex: "#152354"))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                
                //.buttonStyle(MyButtonStyle()) // Apply the custom button style
            }
            .frame(maxWidth: .infinity)
            
            .background(Color.white)
            .padding(.top, 20)
            .padding(.horizontal, 40)
            .shadow(radius: 2)
            .padding(.bottom,20)
            HStack {
                Text("First Name")
                Spacer()
            }.padding(.horizontal, 40)
                .foregroundColor(.secondary)
                .bold()
            CustomTF(hint: "Enter your first name ", value: $email).padding(.horizontal, 40)
            HStack {
                Text("Last Name")
                Spacer()
            }.padding(.horizontal, 40)
                .foregroundColor(.secondary)
                .bold()
            CustomTF(hint: "Enter your last name ", value: $email).padding(.horizontal, 40)
            HStack {
                Text("Email")
                Spacer()
            }.padding(.horizontal, 40)
                .foregroundColor(.secondary)
                .bold()
            CustomTF(hint: "Enter your email ", value: $email).padding(.horizontal, 40)
            HStack {
                Text("Password")
                Spacer()
            }
            .padding(.horizontal, 40)
           // .padding(.top, 10)
            .foregroundColor(.secondary)
            .bold()
            CustomTF( hint: "Enter your password ",isPassword: true, value: $password).padding(.horizontal, 40).padding(.top, 2)
            
       
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: "#FD6969"))
            .padding(.horizontal, 40)
            .padding(.top,20)
            
        }
    }
    struct iOSCheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            // 1
            Button(action: {

                // 2
                configuration.isOn.toggle()

            }, label: {
                HStack {
                    // 3
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                        .foregroundColor(Color(hex: "#152354"))

                    configuration.label
                    Spacer()
                }.padding(.horizontal, 40)
            })
        }
    }
}

#Preview {
    ContentView()
}
