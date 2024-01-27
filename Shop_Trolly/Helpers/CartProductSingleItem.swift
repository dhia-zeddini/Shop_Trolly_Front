//
//  CartProductSingleItem.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 27/1/2024.
//

import SwiftUI

struct CartProductSingleItem: View {
    @State private var quantity: Int=1
    var body: some View {
          HStack {
              Image("jordan") // Replace with actual images
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 130, height: 170)
                  .background(Color.themeGray)
                  .cornerRadius(20)

              VStack(alignment: .leading, spacing: 20) {
                  Text("Enjoy New Nike")
                      .foregroundColor(.themePrimary)
                      .font(.title2)

                  Text("$650")
                      .foregroundColor(.themePrimary)
                      .font(.title2)
                      .bold()

                  HStack(spacing: 20) {
                      QuantityButton(symbol: "+", action: {
                          // Increase quantity action
                         // quantity+=1
                      })
                      Text("\(quantity)")
                          .font(.title2)
                      QuantityButton(symbol: "-", action: {
                          // Decrease quantity action
                         
                      })
                  }
              }
              //.padding(.horizontal, 20)
              Spacer()
          }
          .frame(height: 170)
          .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
          .shadow(radius: 0.5)
         // .padding(.horizontal, 20)
      }
  }

  struct QuantityButton: View {
      let symbol: String
      let action: () -> Void

      var body: some View {
          Button(action: action) {
              ZStack {
                  if symbol == "+" {
                      Circle()
                          .foregroundColor(Color.themeSecondary)
                      Text(symbol)
                          .font(.title2)
                          .foregroundColor(.white)
                  } else {
                      Circle()
                          .stroke(Color.themeSecondary, lineWidth: 1)
                      Text(symbol)
                          .font(.title2)
                          .foregroundColor(.themeSecondary)
                  }
              }
              .frame(width: 30, height: 30)
          }
      }
  }

#Preview {
    CartProductSingleItem()
}
