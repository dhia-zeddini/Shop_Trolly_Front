//
//  SideMenu.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 23/1/2024.
//

import SwiftUI

struct SideMenu: View {
   
    @State private var isOn = false
    @Binding var isVisible: Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            HStack {
                Button(action: { isVisible = false }) {
                                        Image(systemName: "chevron.left")
                                            .font(.title2)
                                    }
                       .padding(.leading, 16)
                       .foregroundColor(.black)
                Spacer()
                Text("MENU")
                    .foregroundColor(Color(hex: "#152354"))
                .bold()
                .font(.title2)
                Spacer()
               
            }
            .padding(.top,20)
            
            
            VStack{
                HStack{
                    Image(systemName: "person")
                        .resizable()
                        //.scaledToFit()
                        .background(Color(hex: "#F7F8F9"))
                        .cornerRadius(80)
                        .frame(width: 80,height: 80)
                    VStack{
                        Text("User Name")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(hex: "#152354"))
                        Button("Edit Profile") {
                            // Forgot password action
                            
                        }.foregroundColor(.secondary)
                    }
                    Spacer()
                }
                HStack{
                    Text("All Categories")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,20)
                HStack{
                    Text("Track Order")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Text("Discover All")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Text("Location")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Text("Payment Cards")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Text("Orders")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Text("Scan")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Text("Settings")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                
                HStack{
                    Text("Track Order")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,10)
                HStack{
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .foregroundColor(.red)
                    Text("Logout")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(hex: "#152354"))
                    Spacer()
                }.padding(.top,30)
                    .padding(.bottom,50)
            }.padding(.top,20)
           
            
        }
        .padding(.horizontal, 40)
        .background(.white)
       // .frame(width: 100)
        //.padding(.top, 20)
        .interactiveDismissDisabled()
        .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width > 0 {
                                isVisible = false
                            }
                        }
                )
        
    }
}

#Preview {
    HomeView()
}
