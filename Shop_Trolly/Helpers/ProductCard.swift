//
//  ProductCard.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 23/1/2024.
//

import SwiftUI

struct ProductCard: View {
    var body: some View {
        VStack {
            VStack {
                Image("jordan") // Replace with actual images
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 200)
                

            }
            .frame(width: 170, height: 200)
            //.frame(width: 100)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(hex: "#F7F8F9")))
        .shadow(radius: 2)
            
            HStack{
                VStack{
                    Text("Air Zoom")
                        .font(.title3)
                        .fontWeight(.light)
                    Text("$650     ")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "#152354"))
                }
                Spacer()
            }
            
        }.frame(width: 150, height: 200)
    }
    
}

#Preview {
    ProductCard()
}
