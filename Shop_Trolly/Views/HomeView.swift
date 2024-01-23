//
//  HomeView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HStack {
                Button(action: { }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                         }
                       .padding(.leading, 16)
                       .foregroundColor(.black)
                Spacer()
                Text("FORGET PASSWORD")
                    .foregroundColor(Color(hex: "#152354"))
                .bold()
                Spacer()
                
            }
            .padding(.top,20)
            .padding(.horizontal, 40)

            HStack {
                VStack{
                    HStack {
                        Text("Enjoy New Nike")
                            .foregroundColor(Color(hex: "#152354"))
                            .font(.title)
                        // .bold()
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    //.padding(.top, 40)
                    HStack {
                        Text("Products")
                            .foregroundColor(Color(hex: "#152354"))
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
                    .background(Color(hex: "#FD6969"))
                    .cornerRadius(5)
                }
                .background(Color.white)
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .cornerRadius(5)
                //.shadow(radius: 2)
                .padding(.bottom,30)
            }.padding(.top, 40)
            
            ScrollView(.horizontal){
                HStack(alignment: .center) {
              
                    ZStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Text("All")
                                .foregroundColor(Color(hex: "#152354"))
                      
                        }
                        
                        .padding()
                        .background(Color(hex: "#F7F8F9"))
                        .cornerRadius(50)
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
                        .background(Color(hex: "#FD6969"))
                        .cornerRadius(5)
                    }
                    ZStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(hex: "#152354"))
                      
                        }
                
                        .padding()
                        .background(Color(hex: "#F7F8F9"))
                        .cornerRadius(50)
                    }
                }
            }.padding(.horizontal, 40)
            
            
            ScrollView (showsIndicators: false){
                   //  LazyVGrid(columns: [GridItem(), GridItem()]) {
                         ForEach(0..<20) { index in
                             // Your table cell content goes here
                             TableCell(index: index)
                                 .frame(height: 50) // Adjust the height as needed
                         }
                    // }
                     //.padding()
                 }
        }
    }

}
struct TableCell: View {
    var index: Int

    var body: some View {
        HStack {
            Text("Column 1 - Row \(index)")
                .padding(.top,10)
                .border(Color.gray, width: 1)
            Text("Column 2 - Row \(index)")
                .padding(.top,10)
                .border(Color.gray, width: 1)
        }
    }
}
#Preview {
    LandingPage()
}
