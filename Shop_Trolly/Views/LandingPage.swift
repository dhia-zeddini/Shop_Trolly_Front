//
//  LandingPage.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct LandingPage: View {
    @State var selectedTab:BottomBarSelectedTab = .home
       var body: some View {
           ZStack{
               NavigationView{
                   VStack {
                       if selectedTab == .home{
                           HomeView()
                       }
                       
                       if selectedTab == .search{
                           Text("Search")
                       }
                       
                       if selectedTab == .plus{
                           Text("Add")
                       }
                       if selectedTab == .chat{
                           ChatView()
                       }
                       if selectedTab == .profile{
                           ProfileView()
                       }
                       Spacer()
                       BottomBar(selectedTab: $selectedTab)
                           .background(Color.themePrimary)
                   }
               }.navigationBarBackButtonHidden(true)
           }
       }
        
}

#Preview {
    LandingPage()
}
