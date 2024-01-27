//
//  HomeView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct HomeView: View {
    static var cards = [
             "Italy",
            "England",
            "ddd",
            "Englffffand",
            "Englh(yhyand",
      
          
           
        ]
    let columnLayout = Array(repeating:GridItem() , count: 2)
    @State private var showSideMenu: Bool = false
    @State private var isSideMenuVisible: Bool = false
    @State private var showDetailsView: Bool = false
    @State private var showCartView: Bool = false
    var body: some View {
        VStack{
            HStack {
                Button(action: { 
                    withAnimation {
                        isSideMenuVisible.toggle()
                    }
                }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                         }
                       //.padding(.leading, 16)
                       .foregroundColor(.black)
                Spacer()
                Text("HOME")
                    .font(.title3)
                    .foregroundColor(Color.themePrimary)
                .bold()
                Spacer()
                
                Button(action: {
                    showCartView=true
                }) {
                    Image(systemName: "cart")
                        .font(.title)
                    }
                .foregroundColor(Color.themePrimary)
                NavigationLink(destination: CartView(), isActive: $showCartView) {
                          EmptyView()
                      }
                //.isDetailLink(true)
                      
                
            }
            .padding(.top,20)
            .padding(.horizontal, 40)

            HStack {
                VStack{
                    HStack {
                        Text("Enjoy New Nike")
                            .foregroundColor(Color.themePrimary)
                            .font(.title)
                        // .bold()
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    //.padding(.top, 40)
                    HStack {
                        Text("Products")
                            .foregroundColor(Color.themePrimary)
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    // .padding(.top, 40)
                    
                    
                }
                
                ZStack {
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                  
                    }
            
                    .padding()
                    .background(Color.themeSecondary)
                    .cornerRadius(5)
                }
                .background(Color.white)
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .cornerRadius(5)
                //.shadow(radius: 2)
                .padding(.bottom,30)
            }.padding(.top, 40)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .center,spacing: 20) {
              
                    ZStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Text("All")
                                .foregroundColor(Color.themePrimary)
                      
                        }
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(Color.themeGray)
                        .cornerRadius(50)
                    }
                    ZStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Image("nike-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Nike")
                                .foregroundColor(.black)
                      
                        }
                
                        .padding()
                        .background(Color.themeSecondary)
                        .cornerRadius(5)
                    }
                    ZStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Image("adidas-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.themePrimary)
                      
                        }
                
                        .padding()
                        .background(Color.themeGray)
                        .cornerRadius(50)
                    }
                    ZStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Image("under-armour-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.themePrimary)
                      
                        }
                
                        .padding()
                        .background(Color.themeGray)
                        .cornerRadius(50)
                    }
                }
            }.padding(.horizontal, 40)
            
            
            ScrollView(showsIndicators: false) {
                           LazyVGrid(columns: columnLayout, spacing: 16) {
                               ForEach(HomeView.cards, id: \.self) { card in
                                   Button(action: {
                                       showDetailsView = true
                                   }) {
                                       ProductCard() 
                                   }
                                   .padding(.top, 70)
                               }
                           }
                           .padding()
                 }
        }
        .sheet(isPresented: $showDetailsView) {
            ProductDetailsView()
                .presentationDetents([.fraction(0.9)])
                .presentationCornerRadius(30)
        }
        .overlay(
            SideMenu(isVisible: $isSideMenuVisible)
        )
    }

}

#Preview {
    LandingPage()
}
