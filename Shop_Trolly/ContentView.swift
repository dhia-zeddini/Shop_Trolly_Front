//
//  ContentView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View{
        ZStack{
            
            NavigationView {
                VStack {
                    HStack (spacing: 25){
                        TabBarButton(text: "SING IN", selectedTab: $selectedTab, assignedTab: 0)
                        TabBarButton(text: "SIGN UP", selectedTab: $selectedTab, assignedTab: 1)
                        
                        
                    }.padding(.top, 10)
                    TabView(selection: $selectedTab) {
                        LoginView(email: .constant(""), password: .constant(""))
                            .tag(0)
                        
                        SignupView(email: .constant(""), password: .constant(""))
                            .tag(1)
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
    }
}
struct TabBarButton: View {
    let text: String
    @Binding var selectedTab: Int
    let assignedTab: Int

    var body: some View {
        Button(action: {
            selectedTab = assignedTab
        }) {
            Text(text)
                .foregroundColor(selectedTab == assignedTab ? Color(hex: "#152354") : .gray)
               // .foregroundColor(Color(hex: "#152354"))
                .bold()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
