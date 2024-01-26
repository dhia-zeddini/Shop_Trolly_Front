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
    @State private var showLoginView: Bool = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20){
                HStack {
                    Button(action: {
                        withAnimation{
                            isVisible.toggle()
                        }
                        
                    }) {
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
                
                userProfile
                menuItems
                
                
            }
            .padding(.horizontal,40)
            .frame(maxWidth: geometry.size.width / 1.3, maxHeight: .infinity, alignment: .leading)
            .background(Color.white)
            .offset(x: isVisible ? 0 : -UIScreen.main.bounds.width)
            .animation(.easeInOut, value: isVisible)
            
        }
    }

private var userProfile: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 80, height: 80)
                .background(Color.themePrimary.opacity(0.1))
                .cornerRadius(40)
            VStack(alignment: .leading) {
                Text("User Name")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.themePrimary)
                Button("Edit Profile") {
                    // Edit profile action
                }
                .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 40)
    }

    private var menuItems: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menuOptions, id: \.self) { option in
                HStack {
                    Button(action: {
                        print(option)
                        
                    }) {
                        Text(option)
                            .font(.title3)
                            .bold()
                        .foregroundColor(.themePrimary)
                    }
                    
                    Spacer()
                }
            }
            logoutButton
        }
    }

    private var logoutButton: some View {
        Button(action: {
            // Logout action
        }) {
            HStack {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.red)
                Button(action: {
                    showLoginView=true
                    
                }) {
                    Text("Logout")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.themePrimary)
                }
                NavigationLink(destination: ContentView(), isActive: $showLoginView) {
                          EmptyView()
                      }
                      .isDetailLink(false)
            }
            .padding(.vertical, 30)
        }
    }
    
    // Consider using a model or array for menu options
    private let menuOptions = [
        "All Categories",
        "Track Order",
        "Discover All",
        "Location",
        "Payment Cards",
        "Orders",
        "Scan",
        "Settings",
        "Track Order"
    ]
}
#Preview {
    LandingPage()
}
